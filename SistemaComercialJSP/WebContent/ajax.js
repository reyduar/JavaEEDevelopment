
var ajax_req;
var texto;

function ajaxRequestBasica() {
	if(document.getElementById("inputMUNICIPIO").value.length > 0 && texto != document.getElementById("inputMUNICIPIO").value)
	{
		texto = document.getElementById("inputMUNICIPIO").value;
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
        ajax_req.onreadystatechange = processarRequisicaoAutoCompletar;//Quando  o atributo readyState for alterado invocar a funcao
        ajax_req.open('GET','municipios.jsp?nome='+texto+"&uf="+document.getElementById("inputUF").value, true);//Abre a conexão tipo, url e boolean indicando se é assíncrona
        ajax_req.send(null);//Informação a ser enviada junto, utilizado no POST		
	}
}

function processarRequisicaoAutoCompletar()
{
	document.getElementById("img").style.display="block";
	document.getElementById("resultado").innerHTML = "";
	if(ajax_req.readyState == 4)//Completo
	{
		if(ajax_req.status == 200)//OK
		{
			if(ajax_req.responseXML)
			{
				var resposta = ajax_req.responseXML.getElementsByTagName("municipio");
				for(var i = 0; i < resposta.length; i++)
				{
					var divAux = document.createElement("div");
					divAux.innerHTML = resposta[i].firstChild.nodeValue;
					divAux.className = "autocompletar";
					divAux.onclick = selecionar;
					document.getElementById("resultado").appendChild(divAux);
				}
				if(resposta.length == 0)
				{
					alert("No coiniciden esos datos");
				}else if(resposta.length == 1)
				{
					document.getElementById("inputMUNICIPIO").value = resposta[0].firstChild.nodeValue;
					document.getElementById("resultado").innerHTML = "";
					texto = resposta[0].firstChild.nodeValue;
				}
				if(document.getElementById("inputMUNICIPIO").value == ""){
					document.getElementById("resultado").innerHTML = "";
					alert("Hola");
				}
			}
		}
		document.getElementById("img").style.display="none";
	}
}

function selecionar(evento)
{
	var divAux = evento ? evento.target : window.event.srcElement;
	document.getElementById("inputMUNICIPIO").value = divAux.firstChild.nodeValue;
	document.getElementById("resultado").innerHTML = "";
}
