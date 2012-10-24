package ar.iariel.siscom.model.bean;
/**
 * 
 * @author Ariel Duarte
 *
 */
public class TipoGrupo {

	private int codigo;
	private Grupo grupo;
	private String nombre;
	
	public Grupo getGrupo() {
		return grupo;
	}
	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
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
	
	
}
