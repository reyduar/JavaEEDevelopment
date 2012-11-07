package ar.iariel.siscom.model.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Date : 07/10/2012
 * @author Ariel Duarte
 *
 */
@Entity
@Table(name="proveedor")
public class Proveedor{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="pro_codigo")
	private Integer codigo;
	
	@Column(name="pro_razon")
	private String nombre;
	
	@Column(name="pro_ruc")
	private String ruc;
	
	@Column(name="pais_codigo")
	private Integer pais;
	
	@Column(name="ciu_codigo")
	private Integer ciudad;
	
	@Column(name="pro_direc")
	private String direccion;
	
	@Column(name="pro_telef")
	private String telefono;
	
	@Column(name="pro_fax")
	private String fax;
	
	@Column(name="pro_mail")
	private String email;
	
	@Column(name="pro_iva")
	private Integer tipo;
	
	
	public Integer getCodigo() {
		return codigo;
	}
	
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	
	public void setTipo(Integer tipo) {
		this.tipo = tipo;
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

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public Integer getPais() {
		return pais;
	}

	public void setPais(Integer pais) {
		this.pais = pais;
	}
	
	public Integer getCiudad() {
		return ciudad;
	}

	public void setCiudad(Integer ciudad) {
		this.ciudad = ciudad;
	}

	@Transient
	public boolean isValido() {
		if (nombre == null || nombre.equals(""))
			return false;
		if (ruc == null || ruc.equals(""))
			return false;
		return true;
	}
}