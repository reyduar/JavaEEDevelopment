package ar.iariel.siscom.model.bean;

/**
 * 
 * @author Ariel Duarte
 *
 */
public class Departamento {
	private Integer codigo;
	private String nombre;
	private String gerente;
	
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getGerente() {
		return gerente;
	}
	public void setGerente(String gerente) {
		this.gerente = gerente;
	}
	
	
}
