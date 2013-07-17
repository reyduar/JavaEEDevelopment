<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr" %>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh" %>
<%@ taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<%@ taglib uri="http://jsftutorials.net/htmLib" prefix="htm" %>

<f:subview id="paginaMenu">
	<t:div id="menu" forceId="true">
		<htm:ul>
			<htm:li><h:form><h:commandButton styleClass="botaoSair" value="Sair" action="#{loginBean.sair}">
			</h:commandButton> </h:form></htm:li>
		</htm:ul>
	</t:div>
</f:subview>