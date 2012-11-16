<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List, ar.iariel.siscom.model.bean.Marca"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Marcas</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Consulta de Marcas</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<table>
				<thead>
					<tr>
						<td>Código</td>
						<td>Descripción</td>
						<td colspan="2">Operaciones</td>
					</tr>
				</thead>
				<c:forEach var="marca" items="${marcas}">
					<tr>
						<td>${marca.codigo}</td>
						<td>${marca.nombre}</td>
						<td><a href="SiscomServletController?cmd=actualizarMarca&codigo=${marca.codigo}">Actualizar</a></td>
						<td><a href="SiscomServletController?cmd=eliminarMarca&codigo=${marca.codigo}">Eliminar</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div id="rightSide">
			<c:import url="menu.jsp"></c:import>
		</div>
		
</body>
</html>