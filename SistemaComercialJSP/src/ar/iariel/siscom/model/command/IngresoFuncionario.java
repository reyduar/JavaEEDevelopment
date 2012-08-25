package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.FuncionarioDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.bean.Cliente;
import ar.iariel.siscom.model.bean.Funcionario;

public class IngresoFuncionario implements InterfaceCommand {

	private FuncionarioDao funcionarioDAO;
	
	//-- Constructor --//
		public IngresoFuncionario(FuncionarioDao funcionarioDAO) {
			super();
			this.funcionarioDAO = funcionarioDAO;
		}
		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
		//-- Instanciamos nuestra clase bean --//
		Funcionario funcionario = new Funcionario();
		
		//-- Seteamos los parametros de este bean con los valores de los input de la pagina --//
		funcionario.setNombre(request.getParameter("nombre"));
		funcionario.setDireccion(request.getParameter("direccion"));
		funcionario.setEmail(request.getParameter("email"));
		funcionario.setBarrio(request.getParameter("barrio"));
		funcionario.setCiudad(request.getParameter("ciudad"));
		funcionario.setDni(request.getParameter("dni"));
		funcionario.setEstado(request.getParameter("estado"));
		funcionario.setTelefono(request.getParameter("telefono"));
		funcionario.setCelular(request.getParameter("celular"));
		funcionario.setProvincia(request.getParameter("provincia"));
		funcionario.setNacionalidad(request.getParameter("nacionalidad"));
		funcionario.setProfesion(request.getParameter("profesion"));
		//TODO Falta trata los campos de fecha
		funcionario.setFechanacimiento(null);
		funcionario.setCargo(request.getParameter("cargo"));
		funcionario.setDepartamento_codigo(Integer.valueOf(request.getParameter("departamento_codigo")));
		funcionario.setSueldo(Double.valueOf(request.getParameter("sueldo")));
		funcionario.setActotal(request.getParameter("actotal") == null ? "N" : "S");
		funcionario.setLogin(request.getParameter("login"));
		funcionario.setPass(request.getParameter("pass"));
		funcionario.setAuditoria(request.getParameter("auditoria"));
		
		//-- Ejecutamos el metodo para guardar los datos de los clientes --//
		
			funcionarioDAO.guardar(funcionario); ///Ejecutamos el metodo gurdar
			request.setAttribute("mensagem", "¡Los datos del funcionario " +funcionario.getNombre()+ " ingresaron con éxito!");
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Error al guardar los datos del funcionario: "+e.getMessage());
			e.printStackTrace();
		}
		 catch (NumberFormatException e) {
				request.setAttribute("mensagem", "Valores numericos invalidos: "+e.getMessage());
				e.printStackTrace();
			}
		request.setAttribute("titulo", "Registro de Datos de Funcionarios");
		return "SiscomController?cmd=editarFuncionario";
	}
	

}
