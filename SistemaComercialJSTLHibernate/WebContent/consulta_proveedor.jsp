<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List, ar.iariel.siscom.model.bean.Proveedor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Proveedores</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
<script type="text/javascript">
function mostrarEmail(procodigo){
	document.getElementById("proveedor"+procodigo).style.display="block";
}
function ocultarEmail(procodigo){
	document.getElementById("proveedor"+procodigo).style.display="none";
}
</script>
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Consulta de Proveedores</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<table>
				<thead>
					<tr>
						<td>Nombre</td>
						<td>Ruc</td>
						<td>Dirección</td>
						<td>Teléfono</td>
						<td colspan="2">Operaciones</td>
					</tr>
				</thead>
				<c:forEach var="proveedor" items="${proveedores}">
					<tr>
						<td>${proveedor.nombre}</td>
						<td>${proveedor.ruc}</td>
						<td>${proveedor.direccion}</td>
						<td>${proveedor.telefono}</td>
						<td><a href="SiscomServletController?cmd=actualizarProveedor&codigo=${proveedor.codigo}">Actualizar</a></td>
						<td><a href="SiscomServletController?cmd=eliminarProveedor&codigo=${proveedor.codigo}">Eliminar</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div id="rightSide">
			<c:import url="menu.jsp"></c:import>
		</div>
		
</body>
</html>