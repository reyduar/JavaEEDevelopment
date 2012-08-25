<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List, ar.iariel.siscom.model.bean.Departamento"%>
<jsp:useBean id="funcionario" scope="request"
	class="ar.iariel.siscom.model.bean.Funcionario"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Funcionario</title>
</head>
<body>
	<jsp:include page="cabecera.jsp"></jsp:include>
	<div align="center">
		<form action="SiscomController"
			style="width: 300px; border-width: thin; border-style: dashed; border-color: navy; color: #0080FF; font-size: 10px; font-family: Tahoma, Verdana, Arial, Sans-Serif">
			<h3>${mensagem}</h3>
			<input type="hidden" name="cmd" value="modificaFuncionario"></input>
			<input type="hidden" name="codigo" value="${param.codigo}"></input>
			<table
				style="color: #004080; font-size: 10px; font-family: Tahoma, Verdana, Arial, Sans-Serif;"
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
					<td><input id="idnombre" name="nombre" style="height: 20px"
						value="${funcionario.nombre}"></input></td>
				</tr>
				<tr>
					<td>Dirección :</td>
					<td><input id="iddireccion" name="direccion" style="height: 20px"
						value="${funcionario.direccion}"></input></td>
				</tr>
				<tr>
					<td>Correo Electronico :</td>
					<td><input id="idemail" name="email" style="height: 20px"
						value="${funcionario.email}"></input></td>
				</tr>
				<tr>
					<td>Barrio :</td>
					<td><input id="idbarrio" name="barrio" style="height: 20px"
						value="${funcionario.barrio}"></input></td>
				</tr>
				<tr>
					<td>Ciudad:</td>
					<td><input id="idciudad" name="ciudad" style="height: 20px"
						value="${funcionario.ciudad}"></input></td>
				</tr>
				<tr>
					<td>D.N.I. :</td>
					<td><input id="iddni" name="dni" style="height: 20px"
						value="${funcionario.dni}"></input></td>
				</tr>
				<tr>
					<td>Estado Civil :</td>
					<td><input id="idestado" name="estado" style="height: 20px"
						value="${funcionario.estado}"></input></td>
				</tr>
				<tr>
					<td>Teléfono :</td>
					<td><input id="idtelefono" name="telefono" style="height: 20px"
						value="${funcionario.telefono}"></input></td>
				</tr>
				<tr>
					<td>Celular :</td>
					<td><input id="idcelular" name="celular" style="height: 20px"
						value="${funcionario.celular}"></input></td>
				</tr>
				<tr>
					<td>Provincia :</td>
					<td><input id="idprovincia" name="provincia" style="height: 20px"
						value="${funcionario.provincia}"></input></td>
				</tr>
				<tr>
					<td>Nacionalidad :</td>
					<td><input id="idnacionalidad" name="nacionalidad" style="height: 20px"
						value="${funcionario.nacionalidad}"></input></td>
				</tr>
				<tr>
					<td>Profesión :</td>
					<td><input id="idprofesion" name="profesion" style="height: 20px"
						value="${funcionario.profesion}"></input></td>
				</tr>
				<tr>
					<td>Fecha de Nacimiento :</td>
					<td><input id="idfechanacimiento" name="fechanacimiento" style="height: 20px"
						value="${funcionario.fechanacimiento}"></input></td>
				</tr>
				<tr>
					<td>Cargo :</td>
					<td><input id="idcargo" name="cargo" style="height: 20px"
						value="${funcionario.cargo}"></input></td>
				</tr>
				<tr>
					<td>Departamento :</td>
					<td><select id="departamento_codigo"
						name="departamento_codigo">
							<%
								List<Departamento> departamentos = (List<Departamento>) request
										.getAttribute("departamentos");
								for (Departamento departamento : departamentos) {
									out.println("<option value='"
											+ departamento.getCodigo()
											+ "' "
											+ (funcionario.getDepartamento_codigo() == departamento
													.getCodigo() ? "SELECTED" : "") + " >"
											+ departamento.getNombre());
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Sueldo :</td>
					<td><input id="idsueldo" name="sueldo" style="height: 20px"
						value="${funcionario.sueldo}"></input></td>
				</tr>
				<tr>
					<td>Acesso total</td>
					<td><input type="checkbox" id="actotal" name="actotal"
						style="height: 20px" value="${funcionario.actotal}" <%=(funcionario.getActotal().equals("S") ? "CHECKED": "")%> ></input></td>
				</tr>
				<tr>
					<td>Login :</td>
					<td><input id="idlogin" name="login" style="height: 20px"
						value="${funcionario.login}"></input></td>
				</tr>
				<tr>
					<td>Contraseña :</td>
					<td><input id="idpass" name="pass" style="height: 20px"
						value="${funcionario.pass}"></input></td>
				</tr>
				<tr>
					<td colspan="2"><a
						href='SiscomController?cmd=editarAcceso&codigo=<%=funcionario.getCodigo()%>'>Actualizar	Accesos</a></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Actualizar Datos del Funcionario" style="height: 23px"></input></td>
				</tr>
			</table>
			<br>
		</form>
	</div>
		<jsp:include page="pie.jsp"></jsp:include>
</body>
</html>