package ar.iariel.siscom.model.bean;

import java.util.List;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class Ciudad {

	private Integer codigo;
	private String nombre;
	
	private List<Proveedor> proveedores ;
	
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
	public List<Proveedor> getProveedores() {
		return proveedores;
	}
	public void setProveedores(List<Proveedor> proveedores) {
		this.proveedores = proveedores;
	}
	
	
	
	
	
}
