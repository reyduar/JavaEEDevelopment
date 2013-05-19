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
        var filtroUF = document.getElementById("uf").options[document.getElementById("uf").selectedIndex].value;
        ajax_req.onreadystatechange = procesarPeticion;//Quando  o atributo readyState for alterado invocar a funcao
        ajax_req.open('GET','municipios.jsp?uf='+filtroUF, true);//Abre a conexão tipo, url e boolean indicando se é assíncrona
        ajax_req.send(null);//Informação a ser enviada junto, utilizado no POST
        document.getElementById("img").style.display="block";
}

function procesarPeticion() {
	// Codigo de tratamiento Ajax
	var selecMun = document.getElementById("municipios");
	selecMun.innerHTML = "";
	selecMun.options[0] = new Option("Cargando...","Cargando...");
	if(ajax_req.readyState == 4)// Completado
	{
		if(ajax_req.status == 200)// Peticion Ok
		{ 
			if(ajax_req.responseXML && ajax_req.responseXML.contentType == "text/xml")
			{
				selecMun.innerHTML = "";
				var respuesta = ajax_req.responseXML.getElementsByTagName("municipio");
				
				for ( var i = 0; i < respuesta.length; i++) {
					// iExplorer
					var nome = respuesta[i].firstChild.nodeValue;
					selecMun.options[selecMun.options.length] = new Option(nome, nome);
					// Firefox, Safari, Opera, etc
					//selecMun.options[selecMun.options.length] = new Option(respuesta[i].textContent, respuesta[i].textContent);
					
				}
			}
		}
		document.getElementById("img").style.display="none";	
	}
}