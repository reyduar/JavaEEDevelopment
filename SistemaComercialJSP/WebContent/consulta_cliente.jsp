<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, ar.iariel.siscom.model.bean.Cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Clientes</title>
</head>
<body>
<jsp:include page="cabecera.jsp"></jsp:include>
<div align="center">
	
	<h3 style="color: #0000FF; text-transform: capitalize; font-style: italic; font-size: 15px; font-family: Verdana, Arial, Sans-Serif; font-weight: bold">${mensagem}</h3>
		<table
			style="color: #004080; font-size: 10px; font-family: Tahoma, Verdana, Arial, Sans-Serif;;"
		     border="1" bordercolor="gray" cellpadding="5">
			<thead>
				<tr style="color: #004080; font-size: 12px; font-family: Tahoma, Verdana, Arial, Sans-Serif; font-weight: bold">
					<th>Codigo</th>
					<th>Nombre</th>
					<th>N°DNI</th>
					<th>Dirección</th>
					<th>Teléfono</th>
					<th>Celular</th>
					<th>E-mail</th>
				</tr>
			</thead>
			<%
			String style = "'color: navy; text-align: center; font-size:small;'";
			List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
			for(Cliente cliente: clientes){ 
			%>
			<tr style=<%=style %>>
				<td><%=cliente.getCodigo()%></td>
				<td><%=cliente.getNombre()%></td>
				<td><%=cliente.getDni()%></td>
				<td><%=cliente.getDireccion()%></td>
				<td><%=cliente.getTelefono()%></td>
				<td><%=cliente.getCelular()%></td>
				<td><%=cliente.getEmail()%></td>
				<td><a href='SiscomController?cmd=editarCliente&codigo=<%=cliente.getCodigo()%>'>Modificar</a></td>
			    <td><a href='SiscomController?cmd=eliminarCliente&codigo=<%=cliente.getCodigo()%>'>Eliminar</a></td>
			</tr>
			<%
		
		} %>
		</table>

</div>
<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>