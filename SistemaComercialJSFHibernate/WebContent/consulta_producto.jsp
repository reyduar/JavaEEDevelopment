<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List, ar.iariel.siscom.model.bean.Articulo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Productos</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Consulta de Productos</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<table>
				<thead>
					<tr>
						<td>Nombre</td>
						<td>Marca</td>
						<td>Grupo</td>
<!-- 						<td>Tipo</td> -->
<!-- 						<td>Precion Venta</td> -->
						<td colspan="2">Operaciones</td>
					</tr>
				</thead>
				<c:forEach var="articulo" items="${articulos}">
					<tr>
						<td>${articulo.artnomreal}</td>
						<td>${articulo.marca.nombre}</td>
						<td>${articulo.grupo.nombre}</td>
<%-- 						<td>${articulo.tipoGrupo.nombre}</td> --%>
<%-- 						<td>${articulo.artpreventa}</td> --%>
						<td><a href="SiscomServletController?cmd=actualizarProducto&codigo=${articulo.codigo}">Actualizar</a></td>
						<td><a href="SiscomServletController?cmd=eliminarProducto&codigo=${articulo.codigo}">Eliminar</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div id="rightSide">
			<c:import url="menu.jsp"></c:import>
		</div>
</body>

</html>