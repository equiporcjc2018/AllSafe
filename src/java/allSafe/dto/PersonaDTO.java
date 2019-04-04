/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author alvarosmh
 */
public class PersonaDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String rutPasaportePersona;
    private Integer employeeId;
    private String nombresPersona;
    private String apePatPersona;
    private String apeMatPersona;
    private String fechaNacPersona;
    private String nacionalidadPersona;
    private String correoPersona;
    private String vigentepersona;
    private CargoDTO cargoidCargo;
    private TallaoberolDTO tallaOberolidTallaOberol;
    private TallapantalonDTO tallaPantalonidTallaPantalon;
    private TipoplantaDTO tipoPlantaidTipoPlanta;
    private TallapoleracamisaDTO tallaPoleraCamisaidtallaPoleraCamisa;
    private TallazapatoDTO tallaZApatoidtallaZApato;
    private List<EppTerrenoDTO> eppterrenoList;
    private List<UsuarioDTO> usuarioallsafeList;
    private List<AsignatrabajadorproyectoDTO> asignatrabajadorproyectoList;

    public PersonaDTO() {
    }

    public PersonaDTO(String rutPasaportePersona) {
        this.rutPasaportePersona = rutPasaportePersona;
    }

    public PersonaDTO(String rutPasaportePersona, Integer employeeId, String nombresPersona, String apePatPersona, String apeMatPersona, String fechaNacPersona, String nacionalidadPersona, String correoPersona, String vigentepersona, CargoDTO cargoidCargo, TallaoberolDTO tallaOberolidTallaOberol, TallapantalonDTO tallaPantalonidTallaPantalon, TipoplantaDTO tipoPlantaidTipoPlanta, TallapoleracamisaDTO tallaPoleraCamisaidtallaPoleraCamisa, TallazapatoDTO tallaZApatoidtallaZApato, List<EppTerrenoDTO> eppterrenoList, List<UsuarioDTO> usuarioallsafeList, List<AsignatrabajadorproyectoDTO> asignatrabajadorproyectoList) {
        this.rutPasaportePersona = rutPasaportePersona;
        this.employeeId = employeeId;
        this.nombresPersona = nombresPersona;
        this.apePatPersona = apePatPersona;
        this.apeMatPersona = apeMatPersona;
        this.fechaNacPersona = fechaNacPersona;
        this.nacionalidadPersona = nacionalidadPersona;
        this.correoPersona = correoPersona;
        this.vigentepersona = vigentepersona;
        this.cargoidCargo = cargoidCargo;
        this.tallaOberolidTallaOberol = tallaOberolidTallaOberol;
        this.tallaPantalonidTallaPantalon = tallaPantalonidTallaPantalon;
        this.tipoPlantaidTipoPlanta = tipoPlantaidTipoPlanta;
        this.tallaPoleraCamisaidtallaPoleraCamisa = tallaPoleraCamisaidtallaPoleraCamisa;
        this.tallaZApatoidtallaZApato = tallaZApatoidtallaZApato;
        this.eppterrenoList = eppterrenoList;
        this.usuarioallsafeList = usuarioallsafeList;
        this.asignatrabajadorproyectoList = asignatrabajadorproyectoList;
    }


    public String getRutPasaportePersona() {
        return rutPasaportePersona;
    }

    public void setRutPasaportePersona(String rutPasaportePersona) {
        this.rutPasaportePersona = rutPasaportePersona;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getNombresPersona() {
        return nombresPersona;
    }

    public void setNombresPersona(String nombresPersona) {
        this.nombresPersona = nombresPersona;
    }

    public String getApePatPersona() {
        return apePatPersona;
    }

    public void setApePatPersona(String apePatPersona) {
        this.apePatPersona = apePatPersona;
    }

    public String getApeMatPersona() {
        return apeMatPersona;
    }

    public void setApeMatPersona(String apeMatPersona) {
        this.apeMatPersona = apeMatPersona;
    }

    public String getFechaNacPersona() {
        return fechaNacPersona;
    }

    public void setFechaNacPersona(String fechaNacPersona) {
        this.fechaNacPersona = fechaNacPersona;
    }

    public String getNacionalidadPersona() {
        return nacionalidadPersona;
    }

    public void setNacionalidadPersona(String nacionalidadPersona) {
        this.nacionalidadPersona = nacionalidadPersona;
    }

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
    }

    public String getVigentepersona() {
        return vigentepersona;
    }

    public void setVigentepersona(String vigentepersona) {
        this.vigentepersona = vigentepersona;
    }

    public CargoDTO getCargoidCargo() {
        return cargoidCargo;
    }

    public void setCargoidCargo(CargoDTO cargoidCargo) {
        this.cargoidCargo = cargoidCargo;
    }

    public TallaoberolDTO getTallaOberolidTallaOberol() {
        return tallaOberolidTallaOberol;
    }

    public void setTallaOberolidTallaOberol(TallaoberolDTO tallaOberolidTallaOberol) {
        this.tallaOberolidTallaOberol = tallaOberolidTallaOberol;
    }

    public TallapantalonDTO getTallaPantalonidTallaPantalon() {
        return tallaPantalonidTallaPantalon;
    }

    public void setTallaPantalonidTallaPantalon(TallapantalonDTO tallaPantalonidTallaPantalon) {
        this.tallaPantalonidTallaPantalon = tallaPantalonidTallaPantalon;
    }

    public TipoplantaDTO getTipoPlantaidTipoPlanta() {
        return tipoPlantaidTipoPlanta;
    }

    public void setTipoPlantaidTipoPlanta(TipoplantaDTO tipoPlantaidTipoPlanta) {
        this.tipoPlantaidTipoPlanta = tipoPlantaidTipoPlanta;
    }

    public TallapoleracamisaDTO getTallaPoleraCamisaidtallaPoleraCamisa() {
        return tallaPoleraCamisaidtallaPoleraCamisa;
    }

    public void setTallaPoleraCamisaidtallaPoleraCamisa(TallapoleracamisaDTO tallaPoleraCamisaidtallaPoleraCamisa) {
        this.tallaPoleraCamisaidtallaPoleraCamisa = tallaPoleraCamisaidtallaPoleraCamisa;
    }

    public TallazapatoDTO getTallaZApatoidtallaZApato() {
        return tallaZApatoidtallaZApato;
    }

    public void setTallaZApatoidtallaZApato(TallazapatoDTO tallaZApatoidtallaZApato) {
        this.tallaZApatoidtallaZApato = tallaZApatoidtallaZApato;
    }

    public List<EppTerrenoDTO> getEppterrenoList() {
        return eppterrenoList;
    }

    public void setEppterrenoList(List<EppTerrenoDTO> eppterrenoList) {
        this.eppterrenoList = eppterrenoList;
    }

    public List<UsuarioDTO> getUsuarioallsafeList() {
        return usuarioallsafeList;
    }

    public void setUsuarioallsafeList(List<UsuarioDTO> usuarioallsafeList) {
        this.usuarioallsafeList = usuarioallsafeList;
    }

    public List<AsignatrabajadorproyectoDTO> getAsignatrabajadorproyectoList() {
        return asignatrabajadorproyectoList;
    }

    public void setAsignatrabajadorproyectoList(List<AsignatrabajadorproyectoDTO> asignatrabajadorproyectoList) {
        this.asignatrabajadorproyectoList = asignatrabajadorproyectoList;
    }

    
}
