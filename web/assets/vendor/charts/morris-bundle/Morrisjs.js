(function(window, document, $, undefined) {
    "use strict";
    $(function() {

        if ($('#morris_area').length) {
            // Use Morris.Area instead of Morris.Line
            Morris.Area({
                element: 'morris_area',
                behaveLikeLine: true,
                data: [
                    { x: '2011 Q1', y: 4, z: 3 },
                    { x: '2011 Q2', y: 2, z: 1 },
                    { x: '2011 Q3', y: 2, z: 3 },
                    { x: '2011 Q4', y: 4, z: 1 }
                ],
                xkey: 'x',
                ykeys: ['y', 'z'],
                labels: ['Y', 'Z'],
                 lineColors: ['#5969ff', '#ff407b'],
                   resize: true,
                   gridTextSize: '14px'

                
            });

        }




        if ($('#morris_line').length) {
            // Use Morris.Area instead of Morris.Line
            Morris.Line({
                element: 'morris_line',
                behaveLikeLine: true,
                data: [
                    { y: '2006', a: 10, b: 20 },
                    { y: '2007', a: 65, b: 45 },
                    { y: '2008', a: 50, b: 40 },
                    { y: '2009', a: 75, b: 65 },
                    { y: '2010', a: 50, b: 40 },
                    { y: '2011', a: 75, b: 65 },
                    { y: '2012', a: 100, b: 90 }
                ],

                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B'],
                   lineColors: ['#5969ff', '#ff407b'],
                     resize: true,
                        gridTextSize: '14px'
            });

        }

       if ($('#morris_bar').length) {
           var testData = $.get("dataGraficoServlet", function(data, status){
                  
           var coche = JSON.stringify(testData,null,'\t');   
           //console.log(coche);   
               // alert("Data aca: " + data + "\nStatus: " + status + coche);
                
            Morris.Bar({
                element: 'morris_bar',
                data: data,
                xkey: 'nombre',
                ykeys: ['cantidad'],
                labels: ['cantidad'],
                barColors: ['#5969ff'],
                resize: true,
                gridTextSize: '14px'

            });
            }); 
        }
        


        if ($('#morris_stacked').length) {
            // Use Morris.Bar
            Morris.Bar({
                element: 'morris_stacked',
                data: [
                    { x: '2011 Q1', y: 3, z: 2, a: 3 },
                    { x: '2011 Q2', y: 2, z: null, a: 1 },
                    { x: '2011 Q3', y: 0, z: 2, a: 4 },
                    { x: '2011 Q4', y: 2, z: 4, a: 3 }
                ],
                xkey: 'x',
                ykeys: ['y', 'z', 'a'],
                labels: ['Y', 'Z', 'A'],
                stacked: true,
                   barColors: ['#5969ff', '#ff407b', '#25d5f2'],
                     resize: true,
                        gridTextSize: '14px'
            });
        }


        if ($('#morris_udateing').length) {
            var nReloads = 0;

            function data(offset) {
                var ret = [];
                for (var x = 0; x <= 360; x += 10) {
                    var v = (offset + x) % 360;
                    ret.push({
                        x: x,
                        y: Math.sin(Math.PI * v / 180).toFixed(4),
                        z: Math.cos(Math.PI * v / 180).toFixed(4)
                    });
                }
                return ret;
            }
            var graph = Morris.Line({
                element: 'morris_udateing',
                data: data(0),
                xkey: 'x',
                ykeys: ['y', 'z'],
                labels: ['sin()', 'cos()'],
                parseTime: false,
                ymin: -1.0,
                ymax: 1.0,
                hideHover: true,
                lineColors: ['#5969ff', '#ff407b'],
                  resize: true
            });

            function update() {
                nReloads++;
                graph.setData(data(5 * nReloads));
                $('#reloadStatus').text(nReloads + ' reloads');
            }
            setInterval(update, 100);
        }


        if ($('#morris_donut').length) {
            var testData2 = $.get("dataGraficoDonaServlet", function(data, status){
                
            Morris.Donut({
                element: 'morris_donut',
                
                data: data,//[
                    //{ value: 70, label: 'Candelaria' },
                    //{ value: 15, label: 'Nueva Aldea' },
                    //{ value: 10, label: 'Otro' }
                //],
             
                labelColor: '#2e2f39',
                   gridTextSize: '14px',
                colors: [
                     "#5969ff",
                                "#ff407b",
                                "#25d5f2",
                                "#ffc750"
                               
                ],

                formatter: function(x) { return x + "%" },
                  resize: true
            });
            });
        }

        if ($('#bar-example').length) {
            var testData3 = $.get("dataGraficoBarrasServlet", function(data, status){
        Morris.Bar({
          element: 'bar-example',
          data: data,//[
            //{ y: '2006', a: 100, b: 90 },
            //{ y: '2007', a: 75,  b: 65 },
            //{ y: '2008', a: 50,  b: 40 },
            //{ y: '2009', a: 75,  b: 65 },
            //{ y: '2010', a: 50,  b: 40 },
            //{ y: '2011', a: 75,  b: 65 },
            //{ y: '2012', a: 100, b: 90 }
          //],
          xkey: 'y',
          ykeys: ['a', 'b'],
          labels: ['Series A', 'Series B']
        });
        });
            }



    });

})(window, document, window.jQuery);