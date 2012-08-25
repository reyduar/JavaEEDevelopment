package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceFuncionarioDao;
import ar.iariel.siscom.model.bean.Cliente;
import ar.iariel.siscom.model.bean.Funcionario;


public class ModificarFuncionario implements InterfaceCommand {

private InterfaceFuncionarioDao funcionarioDAO;
	
	
	//-- Constructor --//
	public ModificarFuncionario(InterfaceFuncionarioDao funcionarioDAO) {
		super();
		this.funcionarioDAO = funcionarioDAO;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
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
				funcionario.setCodigo(Integer.valueOf(request.getParameter("codigo")));
		
		//-- Ejecutamos el metodo para guardar los datos de los clientes --//
		try {
			funcionarioDAO.actualiza(funcionario); ///Ejecutamos el metodo actualizar
			request.setAttribute("mensagem", "¡Los datos del funcionario " +funcionario.getNombre()+ " se actualizaron con éxito!");
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Error al actualizar funcionario: "+e.getMessage());
		} catch (NumberFormatException er) {
			request.setAttribute("mensagem", "Valor invalido: "+er.getMessage());
		}
		request.setAttribute("titulo", "Actualización de Datos de Funcionarios");
		return "SiscomController?cmd=consultaFuncionario";
	}

}
