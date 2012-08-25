 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acceso Denegado</title>
</head>
<body>
<jsp:include page="cabecera.jsp"></jsp:include>
<div align="center" style="color: #004080; font-size: 14px; font-family: Tahoma, Verdana, Arial, Sans-Serif;">
	ATENCION...Usted no tiene autorización para esta opción. Solicite los permisos al Administrador 
	<h3>${mensagem}</h3>	
</div>
	<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>