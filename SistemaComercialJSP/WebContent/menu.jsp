<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
}
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	margin:10px;
}

#basic-accordian{
	border:5px solid #EEE;
	padding:5px;
	width:300px;
	position:absolute;
	left:55%;
	top:10%;
	margin-left:-175px;
	z-index:2;
	margin-top:-50px;
}

.accordion_headings{
	padding:5px;
	background:#99CC00;
	color:#FFFFFF;
	border:1px solid #FFF;
	cursor:pointer;
	font-weight:bold;
}

.accordion_headings:hover{
	background:#00CCFF;
}

.accordion_child{
	padding:15px;
	background:#EEE;
}

.header_highlight{
	background:#00CCFF;
}

</style>
<script type="text/javascript" src="accordian.pack.js"></script>
</head>
<body onload="new Accordian('basic-accordian',5,'header_highlight');">


<div id="basic-accordian" ><!--Parent of the Accordion-->


<!--Start of each accordion item-->
  <div id="test-header" class="accordion_headings header_highlight" >Comercial</div><!--Heading of the accordion ( clicked to show n hide ) -->
  
  <!--Prefix of heading (the DIV above this) and content (the DIV below this) to be same... eg. foo-header & foo-content-->
  
  <div id="test-content"><!--DIV which show/hide on click of header-->
  
  	<!--This DIV is for inline styling like padding...-->
    <div class="accordion_child">
    	<ul>
    		<li style="list-style: square;"><a href="SiscomController?cmd=editarCliente" style="font-family: sans-serif; color: navy; font-size: 14px;" target="cuerpo">Registro de Clientes</a> </li>
    		<li style="list-style: square;"><a href="SiscomController?cmd=consultaCliente" style="font-family: sans-serif; color: navy; font-size: 14px;" target="cuerpo">Consulta de Clientes</a> </li>
    	</ul>
    </div>
    
  </div>
<!--End of each accordion item--> 


<!--Start of each accordion item-->
  <div id="test1-header" class="accordion_headings" >Administrativo</div><!--Heading of the accordion ( clicked to show n hide ) -->
  
  <!--Prefix of heading (the DIV above this) and content (the DIV below this) to be same... eg. foo-header & foo-content-->
  
  <div id="test1-content"><!--DIV which show/hide on click of header-->
  
  	<!--This DIV is for inline styling like padding...-->
    <div class="accordion_child">
    	<ul>
	<li style="list-style: square;"><a href="SiscomController?cmd=editarFuncionario" style="font-family: sans-serif; color: navy; font-size: 14px;" target="cuerpo">Registro de Funcionarios</a></li>
	<li style="list-style: square;"><a href="SiscomController?cmd=consultaFuncionario" style="font-family: sans-serif; color: navy; font-size: 14px;" target="cuerpo">Consulta de Funcionarios</a></li>		
</ul>
    </div>
    
  </div>
<!--End of each accordion item--> 



<!--Start of each accordion item-->
  <div id="test2-header" class="accordion_headings" >About</div><!--Heading of the accordion ( clicked to show n hide ) -->
  
  <!--Prefix of heading (the DIV above this) and content (the DIV below this) to be same... eg. foo-header & foo-content-->
  
  <div id="test2-content"><!--DIV which show/hide on click of header-->
  
  	<!--This DIV is for inline styling like padding...-->
    <div class="accordion_child" style="font-family: sans-serif; color: navy; font-size: 10px;">
    	Sistema Comercial v1.0.0<br />
    	Ariel Duarte ©2012<br />
    	<hr>
    	Resistencia - Argentina<br />
    </div>
    
  </div>
<!--End of each accordion item--> 

<!--Start of each accordion item-->
  <div id="test2-header" class="accordion_headings" >Usuario : ${usuario.nombre}</div><!--Heading of the accordion ( clicked to show n hide ) -->
  
 
<!--End of each accordion item--> 







</div><!--End of accordion parent-->





</body>

</html>