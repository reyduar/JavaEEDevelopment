<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Collection, ar.iariel.siscom.model.bean.Acceso" %>
<jsp:useBean id="funcionario" scope="request" class="ar.iariel.siscom.model.bean.Funcionario"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Acceso de Usuario</title>
</head>
<body>
<jsp:include page="cabecera.jsp"></jsp:include>
<div align="center">
	<form action="SiscomController" style="width:300px; border-width:thin; border-style:dashed; border-color:navy; color: #0080FF; font-size: 10px; font-family: Tahoma, Verdana, Arial, Sans-Serif"
	 >
	<h3>${mensagem}</h3>
	<input type="hidden" name="cmd" value="actualizarAcceso"></input>
	<input type="hidden" name="codigo" value="${funcionario.codigo}"></input>	
<table
		style="color: #004080; font-size: 10px; font-family: Tahoma, Verdana, Arial, Sans-Serif;;"
		border="1" bordercolor="gray" cellpadding="5">
		<thead>
			<tr
				style="color: #004080; font-size: 12px; font-family: Tahoma, Verdana, Arial, Sans-Serif; font-weight: bold">
				<th>Atributo</th>
				<th>Valor</th>
			</tr>
		</thead>
		<tr>
			<td>Nombre :</td>
			<td><input id="nombre" name="nombre" style="height: 20px" value="${funcionario.nombre}"></input></td>
		</tr>
		<%
			Collection<Acceso> accesos = (Collection<Acceso>)request.getAttribute("accesos");
			for(Acceso acesso: accesos)
			{
		%>
		<tr>
			<td><%=acesso.getDescripcion() %></td>
			<td><input type="checkbox" id="<%=acesso.getAcceso_codigo()%>" name="<%=acesso.getAcceso_codigo()%>" style="height: 20px" 
			 <%=(acesso.getFuncionario_codigo() == funcionario.getCodigo() ? "CHECKED": "") %>></input></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="Atualizar" style="height: 23px"></input></td>
		</tr>		
	</table>
	<br>
	</form>
</div>
<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>