package ar.iariel.siscom.model.bean;



/**
 * 
 * @author Ariel Duarte
 * 
 */
public class Proveedor {

	
	//private Ciudad ciudad;
	private String nombre;
	private String ruc;
	private int pais;
	private int ciudad;
	private String direccion;
	private String telefono;
	private String fax;
	private String email;
	private int tipo;
	private int codigo;
	
	

	public int getCiudad() {
		return ciudad;
	}

	public void setCiudad(int ciudad) {
		this.ciudad = ciudad;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public int getPais() {
		return pais;
	}

	public void setPais(int pais) {
		this.pais = pais;
	}

	// Para validar que no cargen los campos en blanco ni nulos
	public boolean isValido() {
		if (nombre == null || nombre.equals(""))
			return false;
		if (ruc == null || ruc.equals(""))
			return false;
		return true;
	}
}