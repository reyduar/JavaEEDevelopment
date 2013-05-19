/**
 * @author Ariel Duarte
 * 
 */

// -- Valida campos obligatorios --//
function validarCampos(form) {
	// -- Validacion del campo nombre --//
	if (form.nombre.value == "") {
		alert("El campo *Nombre no puede estar vacio");
		form.nombre.focus();
		return false;
	}

	// -- Validacion del campo de direccion --//
	if (form.direccion.value == "") {
		alert("El campo *Dirección no puede estar vacio");
		form.direccion.focus();
		return false;
	}

	// -- Validacion del campo DNI --//
	if (form.dni.value == "") {
		alert("El campo *DNI no puede estar vacio");
		form.dni.focus();
		return false;
	}

	// -- Validacion del campo Celular --//
	if (form.celular.value == "") {
		alert("El campo *Celular no puede estar vacio");
		form.celular.focus();
		return false;
	}
	// -- Validacion del campo fecha de nacimiento --//
	if (form.nacimiento.value == "") {
		alert("El este campo *Fecha de Nacimiento no puede estar vacio");
		form.nacimiento.focus();
		return false;
	}
	// -- Validacion del campo sueldo --//
	if (form.ingreso.value == "") {
		alert("El campo *Sueldo no puede estar vacio");
		form.ingreso.focus();
		return false;
	}
	
	// --  Validacion del campo fecha de nacimiento de funcionario --//
	if (form.fechanacimiento.value == "") {
		alert("El este campo *Fecha de Nacimiento no puede estar vacio");
		form.fechanacimiento.focus();
		return false;
	}
}

// -- Funcion para creacion de mascaras de campos --//
function formatoMascara(campoParam, marcaraParam) {
	var campo = campoParam.value.length;
	var salida = marcaraParam.substring(0, 1);
	var texto = marcaraParam.substring(campo);
	if (texto.substring(0, 1) != salida) {
		campoParam.value += texto.substring(0, 1);
	}
}

//-- Funciona para campos numericos --//
function numero(e)
{
	navegador = /msie/i.test(navigator.userAgent);
	if(navegador)
		var tecla = event.keyCode; 	 
	else
		var tecla = e.which;
	
	if(tecla > 47 && tecla < 60)//numero del 0 al 9
		return true;
	else
	{
		if(tecla != 8)//tecla espacio
			return false;
		else
			return true;
	}
}	