<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.List, ar.iariel.siscom.model.bean.Ciudad"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Proveedor</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Actualizar Proveedor</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<fieldset>
				<legend>Actualizar datos de proveedores</legend>
				<form action="SiscomServletController" method="post" class="form">
				
					<input type="hidden" id="cmd" name="cmd" value="actualizarProveedor"/>
					<input type="hidden" id="codigo" name="codigo" value="${param.codigo}"/>
					<label for="nombre" >Nombre*</label>
					<div class="div_texbox">
						<input type="text" name="nombre" id="nombre" value="${proveedor.nombre}"/>
					</div>
										
					<label for="ruc" >Ruc*</label>
					<div class="div_texbox">
						<input type="text" name="ruc" id="ruc" value="${proveedor.ruc}"/>
					</div>
					<label for="pais">Pais*</label>
					<div class="div_texbox">
						<input type="text" name="pais" id="pais" value="${proveedor.pais}"/>
					</div>
					<label for="ciudad">Ciudad*</label>
					<div class="div_texbox">
						<input type="text" name="ciudad" id="ciudad" value="${proveedor.ciudad}"/>
					</div>
					<label for="direccion">Dirección*</label>
					<div class="div_texbox">
						<input type="text" name="direccion" id="direccion" value="${proveedor.direccion}"/>
					</div>
					<label for="telefono">Teléfono*</label>
					<div class="div_texbox">
						<input type="text" name="telefono" id="telefono" value="${proveedor.telefono}"/>
					</div>
					<label for="fax">Celular</label>
					<div class="div_texbox">
						<input type="text" name="fax" id="fax" value="${proveedor.fax}"/>
					</div>
					<label for="email">e-mail</label>
					<div class="div_texbox">
						<input type="text" name="email" id="email" value="${proveedor.email}"/>
					</div>
					<label for="tipo">Tipo de proveedor</label>
					<div class="div_texbox">
						<input type="text" name="tipo" id="tipo" value="${proveedor.tipo}"/>
					</div>
					<div class="button_div" >
						<input name="actualizar" type="submit" value="Actualizar" class="buttons"/>
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