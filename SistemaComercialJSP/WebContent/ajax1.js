var ajax_req;

function ajaxRequestBasica() {

        if (window.XMLHttpRequest) // Firefox, Safari, Opera, etc
		{ 
            ajax_req = new XMLHttpRequest();
        } else if (window.ActiveXObject) // Internet Explorer
		{ 
            try 
			{
                ajax_req = new ActiveXObject("Msxml2.XMLHTTP");//Versões mais novas
            } catch (e) 
			{
                try 
				{
                    ajax_req = new ActiveXObject("Microsoft.XMLHTTP");//Versão mais antiga
                } catch (e) 
				{
				}
            }
        }

        if (!ajax_req) {
            alert("Problemas com a requisição!");
            return false;
        }
        var filtroDE = document.getElementById("inputDE").value;
        var filtroAB = document.getElementById("inputAB").value;
        ajax_req.onreadystatechange = procesarPeticion;//Quando  o atributo readyState for alterado invocar a funcao
        ajax_req.open('GET','municipios.jsp?nome='+filtroDE+'&uf='+filtroAB, true);//Abre a conexão tipo, url e boolean indicando se é assíncrona
        ajax_req.send(null);//Informação a ser enviada junto, utilizado no POST
}

function procesarPeticion() {
	var salida = "";
	// Codigo de tratamiento Ajax
	if(ajax_req.readyState == 4)// Completado
	{
		if(ajax_req.status == 200)// Peticion Ok
		{ 
			if(ajax_req.responseXML && ajax_req.responseXML.contentType == "text/xml")
			{
				var respuesta = ajax_req.responseXML.getElementsByTagName("municipio");
				salida += "<h3> Cantidad Registros: "+ respuesta.length + "</h3>" ;
				for ( var i = 0; i < respuesta.length; i++) {
					salida += respuesta[i].textContent+"<br/>";
				}
			}
		}
		
	}
	//alert("Estado de Peticion"+ajax_req.readyState);
	
	document.getElementById("resultado").innerHTML = salida;
}