package ar.iariel.siscom.model.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.iariel.siscom.model.DAO.ClienteDao;
import ar.iariel.siscom.model.DAO.InterfaceClienteDao;
import ar.iariel.siscom.model.bean.Cliente;

public class ModificarCliente implements InterfaceCommand {

	private InterfaceClienteDao clienteDAO;
	
	
	//-- Constructor --//
	public ModificarCliente(InterfaceClienteDao clienteDAO) {
		super();
		this.clienteDAO = clienteDAO;
	}
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
		//-- Instanciamos nuestra clase bean --//
				Cliente cliente = new Cliente();
				
				//-- Seteamos los parametros de este bean con los valores de los input de la pagina --//
				cliente.setCodigo(Integer.valueOf(request.getParameter("codigo")));
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
				cliente.setIngreso(Double.valueOf(request.getParameter("ingreso")));
				cliente.setReferencia(request.getParameter("referencia"));
				cliente.setTeleref(request.getParameter("teleref"));
				
				
				//-- Ejecutamos el metodo para guardar los datos de los clientes --//
					clienteDAO.actualiza(cliente); ///Ejecutamos el metodo actualizar
					request.setAttribute("mensagem", "¡Los datos del cliente " +cliente.getNombre()+ " se actualizaron con éxito!");
				} catch (SQLException e) {
					request.setAttribute("mensagem", "Error al actualizar cliente: "+e.getMessage());
				} catch (NumberFormatException er) {
					request.setAttribute("mensagem", "Valor numerico invalido: "+er.getMessage());
				}
				request.setAttribute("titulo", "Actualización de Datos de Clientes");
				return "SiscomController?cmd=consultaCliente";
	}



}
