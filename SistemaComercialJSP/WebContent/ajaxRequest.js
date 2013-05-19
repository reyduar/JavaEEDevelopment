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
        ajax_req.onreadystatechange = FUNCAO;//Quando  o atributo readyState for alterado invocar a funcao
        ajax_req.open('GET',ENDERECO, true);//Abre a conexão tipo, url e boolean indicando se é assíncrona
        ajax_req.send(null);//Informação a ser enviada junto, utilizado no POST
}

function criarAjaxRequest()
{
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
}

function ajaxRequestPost(url, funcao, param) 
{
		criarAjaxRequest();
        if (!ajax_req) {
            alert("Problemas com a requisição!");
            return false;
        }
        ajax_req.onreadystatechange = eval(funcao);
        ajax_req.open('POST', url, true);
		ajax_req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        ajax_req.send(param);
}

function ajaxRequestGet(url, funcao, param) 
{
		criarAjaxRequest();
        if (!ajax_req) {
            alert("Problemas com a requisição!");
            return false;
        }
        ajax_req.onreadystatechange = eval(funcao);
        ajax_req.open('GET',url+"?"+param, true);
        ajax_req.send(null);
}