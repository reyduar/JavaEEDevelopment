<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List, ar.iariel.siscom.model.bean.Grupo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Grupos</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Consulta de Grupos</h1>
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
				<c:forEach var="grupo" items="${grupos}">
					<tr>
						<td>${grupo.codigo}</td>
						<td>${grupo.nombre}</td>
						<td><a href="SiscomServletController?cmd=actualizarGrupo&codigo=${grupo.codigo}">Actualizar</a></td>
						<td><a href="SiscomServletController?cmd=eliminarGrupo&codigo=${grupo.codigo}">Eliminar</a></td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div id="rightSide">
			<c:import url="menu.jsp"></c:import>
		</div>
		
</body>
</html>