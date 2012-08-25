package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.security.ntlm.Client;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.bean.Cliente;

/**
 * 
 * @author reynaldo.duarte
 *
 */
//-- Esta clase gestiona el registro de datos de los clientes --//
public class IngresoCliente implements InterfaceCommand {

	private InterfaceClienteDao clienteDAO;
	
	
	//-- Constructor --//
	public IngresoCliente(InterfaceClienteDao clienteDAO) {
		super();
		this.clienteDAO = clienteDAO;
	}


	//-- El metodo se encarga de recibir la peticiones HTTP y ejecuta el comando que le se indica en la Accion --//
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("titulo", "Registro de Datos de Clientes");
		try {
		//-- Instanciamos nuestra clase bean --//
		Cliente cliente = new Cliente();
		//-- Seteamos los parametros de este bean con los valores de los input de la pagina --//
		cliente.setNombre(request.getParameter("nombre"));
		cliente.setDireccion(request.getParameter("direccion"));
		cliente.setEmail(request.getParameter("email"));
		cliente.setBarrio(request.getParameter("barrio"));
		cliente.setCiudad(request.getParameter("ciudad"));
		cliente.setDni(request.getParameter("dni"));
		cliente.setEstado(request.getParameter("estado"));
		cliente.setTelefono(request.getParameter("telefono"));
		cliente.setCelular(request.getParameter("celular"));
		cliente.setCpf(request.getParameter("cpf"));
		cliente.setObs(request.getParameter("obs"));
		cliente.setProvincia(request.getParameter("provincia"));
		cliente.setLocalidad(request.getParameter("localidad"));
		//TODO Falta trata los campos de fecha
		cliente.setNacimiento(null);
		cliente.setDesde(null);
		cliente.setCnpj(request.getParameter("cnpj"));
		cliente.setInsest(request.getParameter("insest"));
		cliente.setSexo(request.getParameter("sexo"));
		cliente.setProfesion(request.getParameter("profesion"));
		cliente.setEmpresa(request.getParameter("empresa"));
		cliente.setTelempresa(request.getParameter("telempresa"));
		cliente.setIngreso(request.getParameter("ingreso").equals("") ? 0 :  Double.valueOf(request.getParameter("ingreso")));
		cliente.setReferencia(request.getParameter("referencia"));
		cliente.setTeleref(request.getParameter("teleref"));
		
		
		//-- Ejecutamos el metodo para guardar los datos de los clientes --//
		
			clienteDAO.guardar(cliente); ///Ejecutamos el metodo gurdar
			request.setAttribute("mensagem", "¡Los datos del cliente " +cliente.getNombre()+ " ingresaron con éxito!");
		} catch (SQLException e) {
			request.setAttribute("mensagem", "Error al guardar los datos del cliente: "+e.getMessage());
			e.printStackTrace();
		}
		catch (NumberFormatException e) {
			request.setAttribute("mensagem", "Valor numerico invalido: "+e.getMessage());
			e.printStackTrace();
		}
		
		//return "ingreso_cliente.jsp";
		return "SiscomController?cmd=editarCliente";
	}

}
