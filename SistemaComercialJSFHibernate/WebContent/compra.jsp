<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nota de Fiscal de Proveedor</title>
<link rel="stylesheet" href="css/principal.css"  type="text/css" />
</head>
<body>
	<f:view>
	<!-- Div para mensaje de error  -->
		<htm:div id="divPrincipal" styleClass="corpoPrincipal">
			<htm:h1 id="titulo">Sistema Comercial - Nota Fiscal de Proveedor</htm:h1>
			<htm:div id="mensajes" rendered="#{not empty facesContext.maximumSeverity }">
			<h:panelGrid id="panelMensajes" columns="2" >
				 <h:graphicImage value="images/delete-comment-red.gif" title="Error!"></h:graphicImage>
				 <h:messages></h:messages>
			</h:panelGrid>
			</htm:div><!-- Div mensajes de error  -->
			<htm:div styleClass="corpoEsquerda">
			
				<htm:fieldset styleClass="borda"><!-- fieldset de proveedor  -->
				
					<htm:legend styleClass="legenda">Proveedor</htm:legend>
					<h:form id="formProveedor"><!-- form general html  -->
						
						<tr:subform><!-- subform de trinidad  -->
							
								<h:panelGrid columns="2" styleClass="panelGrid"	columnClasses="colunaDireita, colunaEsquerda">
									<h:outputText value="Proveedor: " styleClass="labelInput"></h:outputText>
									
									<h:selectOneMenu id="selectProveedpr" value="#{compraBean.codigoProveedor }"
										title="Seleccione un proveedor" disabled="#{not empty compraBean.compra.proveedor}"
										required="true" requiredMessage="Seleccione un proveedor.">
										<f:selectItems value="#{compraBackingBean.proveedores  }" />
									</h:selectOneMenu>
									<h:panelGroup></h:panelGroup>
									
									<h:panelGroup>
										<h:commandButton id="confirmarProveedor" value="Confirmar" action="#{compraBean.comfirmarProveedor}" styleClass="panelBotaoConfirmar"></h:commandButton>
										<h:commandButton id="modificarProveedor" value="Modificar" actionListener="#{compraBean.modificarProveedor}" styleClass="panelBotaoEditar"></h:commandButton>
									</h:panelGroup><!-- grid grupo de botones  -->
									
								</h:panelGrid><!-- grid grupo de columnas  -->
							</tr:subform><!-- subform de trinidad  -->
						
						<h:panelGrid columns="1" styleClass="panelGrid" rendered="#{empty compraBean.compra.proveedor}">
							<h:panelGrid columns="2" width="100%" columnClasses="colunaDireita, colunaEsquerda">
								<h:outputText value="Nombre :" styleClass="labelInput"></h:outputText>
								<h:inputText id="inputNombreProveedor" value="#{compraBackingBean.proveedor.nombre }" 
								 converter="stringNull" 
								 ></h:inputText>
								<h:outputText value="Ruc :" styleClass="labelInput"></h:outputText>
								<h:inputText id="inputRucProveedor" value="#{compraBackingBean.proveedor.ruc }"
								converter="stringNull" 
								></h:inputText>
							</h:panelGrid>
							<h:commandButton id="buscarProveedor" value="Buscar" styleClass="panelBotaoConsultar"></h:commandButton>
						</h:panelGrid><!-- grid para filtrar  -->
						
					</h:form><!-- form general html  -->
				</htm:fieldset><!-- fieldset de proveedor  -->
				
				<htm:fieldset styleClass="borda" rendered="#{not empty compraBean.compra.proveedor}"><!-- fieldset de articulos  -->
					<htm:legend styleClass="legenda">Artículo</htm:legend>
					
						<h:form id="formArticulos">
								<t:panelGrid columns="1" styleClass="panelGrid" >
									<t:panelGrid columns="2" width="100%" columnClasses="colunaDireita, colunaEsquerda" >
										<h:outputText value="Nombre :" styleClass="labelInput"></h:outputText>
										<h:inputText id="inputDescArticulo" value="#{compraBackingBean.articulo.artnomreal }"
										converter="stringNull" >
										</h:inputText>
									</t:panelGrid>
									<h:commandButton id="consultarArticulo" value="Buscar" styleClass="panelBotaoConsultar"></h:commandButton>
								</t:panelGrid>
						
							<t:dataTable id="listaArticulos" styleClass="dataTableProdutos" width="100%"
							value="#{compraBackingBean.articulos}" var="articulo" rowClasses="linhaClara, linhaEscura">
								<t:column sortable="true" sortPropertyName="codigo" >
										<f:facet name="header">
											<h:outputText value="Cod."></h:outputText>
										</f:facet>
										<h:outputText value="#{articulo.codigo}"></h:outputText>
								</t:column><!-- 1º Columna  -->
								
								<t:column sortable="true" sortPropertyName="artnomreal">
										<f:facet name="header">
											<h:outputText value="Nombre"></h:outputText>
										</f:facet>
										<h:outputText value="#{articulo.artnomreal }"></h:outputText>
								</t:column><!-- 2º Columna  --> 
								
								<t:column>
										<f:facet name="header">
											<h:outputText value="#"></h:outputText>
										</f:facet>
										<h:selectBooleanCheckbox id="articuloSelecionado"
										value="#{compraBean.articulosSelecionados[articulo.codigo]}"></h:selectBooleanCheckbox>
								</t:column><!-- 3º Columna  --> 
								
								<f:facet name="footer">
										<h:outputText value="No hay artículos."
										rendered="#{empty compraBackingBean.articulos}"></h:outputText>
								</f:facet>
								</t:dataTable>
								<h:commandButton id="selecionarArticulo"  rendered="#{not empty compraBackingBean.articulos}"
								value="Incluir" styleClass="panelBotaoAdicionar" actionListener="#{compraBean.selecionarArticulo}">
								</h:commandButton>
					</h:form><!-- form de articulos  -->
				
				</htm:fieldset><!-- fieldset de articulos -->
				
			</htm:div><!-- Div cuerpo de izquierda  -->
				<htm:div styleClass="corpoDireita" ><!-- Div cuerpo de Derecho  -->
					<h:form id="notaFiscal">
					<t:div id="nrNF" forceId="true">
							<h:outputText styleClass="inputNrNF" value="Factura Proveedor Nº: "  />
							<h:inputText value="#{compraBean.compra.numero}" required="true" requiredMessage="Ingrese Nº de Factura.">
								<f:converter converterId="javax.faces.Long"  />
								<f:validateLongRange maximum="999999" minimum="1"  />
							</h:inputText><htm:br/>
							<htm:small style="font-size:10px;">Operación</htm:small>
							<h:selectOneMenu id="selectTipOpe" value="#{compraBean.codigoTipOpe}">
								<f:selectItems value="#{compraBackingBean.operaciones}" />
							</h:selectOneMenu>
					</t:div>
						<htm:div styleClass="previewNotaFiscal"  rendered="#{not empty compraBean.compra.proveedor}">
							<htm:div id="dadosNotaFiscal">
							<htm:p>Nombre/Razón Social:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.nombre}"/></htm:big>
							<htm:p>Ruc:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.ruc}"/></htm:big>
							<htm:p>Ciudad:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.ciudad.nombre}"/></htm:big>
							<htm:p>Dirección:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.direccion}"/></htm:big>
							<htm:p>Teléfono:</htm:p><htm:big><h:outputText value="#{compraBean.compra.proveedor.telefono}"/></htm:big>
						</htm:div>
					</h:form>
				</htm:div><!-- Div vista de nota fiscal  -->
						
				</htm:div><!-- Div cuerpo de Derecho  -->
		</htm:div><!-- Div principal  -->
	</f:view>
</body>
</html>