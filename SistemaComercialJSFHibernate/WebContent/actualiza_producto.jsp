<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualización de Producto</title>
<link rel="stylesheet" type="text/css" href="principal2.css">
</head>
<body>
	<div id="container">
		<div id="top">
			<h1>Actualización de Producto</h1>
			<h4>${mensagem}</h4>
		</div>
		<div id="leftSide">
			<fieldset>
				<legend>Actualización de datos de productos</legend>
				<form action="SiscomServletController" method="post" class="form">
				
					<input type="hidden" id="cmd" name="cmd" value="actualizarProducto"/>
					<input type="hidden" id="codigo" name="codigo" value="${param.codigo}"/>
					<label for="grupo" >Grupo*</label>
					<div class="div_texbox">
						<select  name="gru_codigo">
							<c:forEach var = "grupo" items="${grupos}">
								<option value="${grupo.codigo}" ${grupo.codigo eq articulo.grupo.codigo ? "SELECTED" : ""} >${grupo.nombre}</option>
							</c:forEach>
						</select>
					</div>
					<label for="tg_codigo" >Tipo de Grupo*</label>
					<div class="div_texbox">
						<select  name="tg_codigo">
							<c:forEach var = "tipoGrupo" items="${tipoGrupos}">
								<option value="${tipoGrupo.codigo}" ${tipoGrupo.codigo eq articulo.tipoGrupo.codigo ? "SELECTED" : ""} >${tipoGrupo.nombre}</option>
							</c:forEach>
						</select>
					</div>
					
					<label for="marca" >Marca*</label>
					<div class="div_texbox">
						<select name="mar_codigo">
							<c:forEach var="marca" items="${marcas}">
								<option value="${marca.codigo}"
									${marca.codigo eq articulo.marca.codigo ? "SELECTED" : ""}>${marca.nombre}</option>
							</c:forEach>
						</select>
					</div>
					
					<label for="pais" >Procedencia*</label>
					<div class="div_texbox">
						<select name="pais_codigo">
							<c:forEach var="pais" items="${paises}">
								<option value="${pais.codigo}"
									${pais.codigo eq articulo.pais.codigo ? "SELECTED" : ""}>${pais.nombre}</option>
							</c:forEach>
						</select> 
					</div>
					<label for="artnomreal">Nombre*</label>
					<div class="div_texbox">
						<input type="text" name="artnomreal" id="artnomreal" value="${articulo.artnomreal}"/>
					</div>
					<label for="artbarra">Código de Barras*</label>
					<div class="div_texbox">
						<input type="text" name="artbarra" id="artbarra" value="${articulo.artbarra}"/>
					</div>
					<label for="artcodorigen">Código Generado*</label>
					<div class="div_texbox">
						<input type="text" name="artcodorigen" id="artcodorigen" value="${articulo.artcodorigen}"/>
					</div>
					
					<label for="codigomarca">Código Fabrica</label>
					<div class="div_texbox">
						<input type="text" name="codigomarca" id="codigomarca" value="${articulo.codigomarca}"/>
					</div>
					
					<label for="artnropieza">Nº de Pieza</label>
					<div class="div_texbox">
						<input type="text" name="artnropieza" id="artnropieza" value="${articulo.artnropieza}"/>
					</div>
					
					<label for="arttpiva">Tipo de Impuesto</label>
					<div class="div_texbox">
						<input type="text" name="arttpiva" id="arttpiva" value="${articulo.arttpiva}"/>
					</div>
					
					<label for="artivaporc">Impuesto %</label>
					<div class="div_texbox">
						<input type="text" name="artivaporc" id="artivaporc" value="${articulo.artivaporc}"/>
					</div>
					
					<label for="artstockmin">Stock Minimo*</label>
					<div class="div_texbox">
						<input type="text" name="artstockmin" id="artstockmin" value="${articulo.artstockmin}"/>
					</div>
					
					<label for="ubicacion">Ubicacion</label>
					<div class="div_texbox">
						<select name="ubica_codigo">
							<c:forEach var="ubicacion" items="${ubicaciones}">
								<option value="${ubicacion.codigo}"
									${ubicacion.codigo eq articulo.ubicacion.codigo ? "SELECTED" : ""}>${ubicacion.nombre}</option>
							</c:forEach>
						</select>
					</div>
					
					<label for="artprecact">Precio Costo</label>
					<div class="div_texbox">
						<input type="text" name="artprecact" id="artprecact" value="${articulo.artprecact}"/>
					</div>
					
					<label for="artpreventa">Precio Venta</label>
					<div class="div_texbox">
						<input type="text" name="artpreventa" id="artpreventa" value="${articulo.artpreventa}"/>
					</div>
					
					<label for="artobs">Observación</label>
					<div class="div_texbox">
						<input type="text" name="artobs" id="artobs" value="${articulo.artobs}"/>
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