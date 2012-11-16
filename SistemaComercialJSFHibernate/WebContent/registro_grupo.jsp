<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de Grupos</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Registro de Grupos</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<fieldset>
				<legend>Registro de grupos de productos</legend>
				<form action="SiscomServletController" method="post" class="form">
				
					<input type="hidden" id="cmd" name="cmd" value="registrarGrupo"/>
					
					<label for="nombre" >Descripción*</label>
					<div class="div_texbox">
						<input type="text" name="nombre" id="nombre" value="${grupo.nombre}"/>
					</div>
					<div class="button_div" >
						<input name="guardar" type="submit" value="Guardar" class="buttons"/>
					</div>
				</form>
			</fieldset>
		</div>
		<div id="rightSide">
			<c:import url="menu.jsp"></c:import>
		</div>
	</div>
</body>
</html>