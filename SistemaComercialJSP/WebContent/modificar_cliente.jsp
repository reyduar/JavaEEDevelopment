<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificación de Clientes</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<jsp:include page="cabecera.jsp"></jsp:include>
<div align="left">
	<form action="SiscomController" style="background-color: #9BCDFF">
	<h3 style="color: #0000FF; text-transform: capitalize; font-style: italic; font-size: 15px; font-family: Verdana, Arial, Sans-Serif; font-weight: bold">${mensagem}</h3>
		<input type="hidden" name="cmd" value = "modificarCliente"></input>
		<input type="hidden" name="codigo" value = "${param.codigo}"></input>
		<table
			style="color: #0080FF; text-transform: none; font-style: normal; font-size: 18px; 
			font-family: Tahoma, Verdana, Arial, Sans-Serif; font-weight: bold; line-height: normal; 
			border-bottom-width: thin; border-top-style: groove; border-right-style: groove; 
			border-bottom-color: #8080FF; border-top-width: thin; border-bottom-style: groove; 
			border-left-color: #8080FF; border-top-color: #8080FF; border-left-style: groove; 
			border-right-color: #8080FF; border-right-width: thin; border-left-width: thin" cellpadding="5">
			<thead style="background-color: #FFFFFF">
				<tr>
					<th
						style="border-bottom-width: thin; border-bottom-style: groove; border-top-style: groove; border-left-color: #8080FF; border-top-color: #8080FF; border-right-color: #8080FF; border-left-style: groove; border-right-width: thin; border-right-style: groove; border-left-width: thin; border-bottom-color: #8080FF; border-top-width: thin">Descripción</th>
					<th
						style="border-bottom-width: thin; border-bottom-style: groove; border-top-style: groove; border-left-color: #8080FF; border-top-color: #8080FF; border-right-color: #8080FF; border-left-style: groove; border-right-width: thin; border-right-style: groove; border-left-width: thin; border-bottom-color: #8080FF; border-top-width: thin">Valor</th>
				</tr>
			</thead>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Nombre o Razón Social</td>
				<td><input id="idnombre" name="nombre" style="width: 500px" value="${cliente.nombre}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Dirección</td>
				<td><input id="iddireccion" name="direccion" style="width: 500px" value="${cliente.direccion}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Correo Eléctronico</td>
				<td><input id="idemail" name="email" style="width: 500px" value="${cliente.email}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Barrio</td>
				<td><input id="idbarrio" name="barrio" style="width: 500px" value="${cliente.barrio}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Ciudad</td>
				<td><input id="idciudad" name="ciudad" style="width: 500px" value="${cliente.ciudad}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">D.N.I.</td>
				<td><input id="iddni" name="dni" style="width: 500px" value="${cliente.dni}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Estado Civil</td>
				<td><input id="idestado" name="estado" style="width: 500px" value="${cliente.estado}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Teléfono</td>
				<td><input id="idtelefono" name="telefono" style="width: 500px" value="${cliente.telefono}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Teléfono Movil</td>
				<td><input id="idcelular" name="celular" style="width: 500px" value="${cliente.celular}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Nacionalidad</td>
				<td><input id="idcpf" name="cpf" style="width: 500px" value="${cliente.cpf}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Observaciones</td>
				<td><input id="idobs" name="obs" style="width: 500px" value="${cliente.obs}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Provincia</td>
				<td><input id="idprovincia" name="provincia" style="width: 500px" value="${cliente.provincia}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Localidad</td>
				<td><input id="idlocalidad" name="localidad" style="width: 500px" value="${cliente.localidad}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Fecha de Nacimiento</td>
				<td><input id="idnacimiento" name="nacimiento" style="width: 254px" value="${cliente.nacimiento}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Ingreso Fecha</td>
				<td><input id="iddesde" name="desde" style="width: 256px" value="${cliente.desde}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">N° de Pasaporte</td>
				<td><input id="idcnpj" name="cnpj" style="width: 500px" value="${cliente.cnpj}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">N° de CUIL</td>
				<td><input id="idinsest" name="insest" style="width: 500px" value="${cliente.insest}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Genero Sexual</td>
				<td><input id="idsexo" name="sexo" style="width: 500px" value="${cliente.sexo}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Profesión</td>
				<td><input id="idprofesion" name="profesion" style="width: 500px" value="${cliente.profesion}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Empresa</td>
				<td><input id="idempresa" name="empresa" style="width: 500px" value="${cliente.empresa}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Teléfono de la Empresa</td>
				<td><input id="idtelempresa" name="telempresa" style="width: 500px" value="${cliente.telempresa}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Sueldo $</td>
				<td><input id="idingreso" name="ingreso" style="width: 500px" value="${cliente.ingreso}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Referencia Personal</td>
				<td><input id="idreferencia" name="referencia" style="width: 500px" value="${cliente.referencia}"></td>
			</tr>
			<tr>
				<td style="color: #000000; text-transform: capitalize; font-size: 15px; font-family: Tahoma, Verdana, Arial, Sans-Serif">Referencia Teléfono</td>
				<td><input id="idteleref" name="teleref" style="width: 500px" value="${cliente.teleref}"></td>
			</tr>
			<tr style="background-color: #FFFFFF">
				<td colspan="2" align="center"><input type="submit" value="Actualizar Datos del Cliente"></td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>