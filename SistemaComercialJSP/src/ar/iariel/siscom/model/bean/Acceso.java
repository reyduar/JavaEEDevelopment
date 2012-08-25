package ar.iariel.siscom.model.bean;

/**
 * 
 * @author Ariel Duarte
 * 
 */
public class Acceso {
	
	private Integer acceso_codigo;
	private Integer funcionario_codigo;
	private String comando;
	private String descripcion;

	
	
	
	public Integer getAcceso_codigo() {
		return acceso_codigo;
	}

	public void setAcceso_codigo(Integer acceso_codigo) {
		this.acceso_codigo = acceso_codigo;
	}

	public Integer getFuncionario_codigo() {
		return funcionario_codigo;
	}

	public void setFuncionario_codigo(Integer funcionario_codigo) {
		this.funcionario_codigo = funcionario_codigo;
	}

	public String getComando() {
		return comando;
	}

	public void setComando(String comando) {
		this.comando = comando;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
