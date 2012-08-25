<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema Comercial</title>

<!-- Codigo JavaScript para direccion el login a la pagina inicial y no dentro de un frame del menu -->
<script type="text/javascript">
	if(top.location != self.location){
		top.location = self.location;
	}
</script>

</head>
<body>
	<jsp:include page="cabecera.jsp"></jsp:include>
	<div align="center">
		<form action="SiscomController"
			style="width: 800px; border-style: solid; border-color: gray; color: PaleGoldenRod; font-size: 9px; font-family: Tahoma, Verdana, Arial, Sans-Serif"
			method="post">
			<h3 style="color: red;">
				<b>${mensagem}</b>
			</h3>
			<input type="hidden" name="cmd" value="accesarUsuario"></input>

			<table
				style="color: #0080FF; font-family: Tahoma, Verdana, Arial, Sans-Serif; font-size: 12px;">

				<tr>
					<td>Usuario</td>
					<td><input id="login" name="login"
						style="color: #0080FF; height: 24px; width: 383px"
						value="${usuario.nombre}"></input></td>
				</tr>
				<tr>
					<td>Clave</td>
					<td><input type="password" id="pass" name="pass"
						style="color: #0080FF; height: 24px; width: 383px"
						value="${usuario.pass}"></input></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"
						value="Ingresar" style="height: 29px; width: 159px"></input>
					</td>
					<br>
				</tr>
			</table>

		</form>
	</div>
	<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>