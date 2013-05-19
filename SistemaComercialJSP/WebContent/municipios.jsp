<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>
<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*;"%>
<%	response.setContentType("text/xml"); %>
<%="<resultado>"%>
<%
	//Procura pelo parâmetro enviado via POST ou GET chamado 'nome'
	String nome = request.getParameter("nome") == null ? "" : request.getParameter("nome") ;
	//Procura pelo parâmetro enviado via POST ou GET chamado 'uf'
	String uf = request.getParameter("uf") == null ? "" : request.getParameter("uf") ;
	
	//Abre o arquivo municipios.xml
	File fMunXML= new File(request.getRealPath("/")+ "municipios.xml");
	//Cria uma nova instância de DocumentBuilderFactory 
	DocumentBuilderFactory dbc = DocumentBuilderFactory.newInstance();
	//Cria uma nova instância de DocumentBuilder	
	DocumentBuilder db = dbc.newDocumentBuilder();
	//Transforma o arquivo municipios.xml em um objeto Document	
	Document munXML = db.parse(fMunXML);
	//Obtêm todos os elementos representados pela tag municipio
	NodeList municipios = munXML.getElementsByTagName("municipio");
	//variável que determina o comprimento do parametro nome
	int comprimento = 0;
	//Percorre a lista de municipios
	for(int i = 0 ; i < municipios.getLength() ; i++)
	{
		//Determina o comprimento do parâmetro nome
		comprimento = nome.length() > municipios.item(i).getFirstChild().getTextContent().length() ? 
				municipios.item(i).getFirstChild().getTextContent().length() : nome.length();
				
		//Verifica se a uf é nula ou igual a do municipio atual
		if(uf.equals("") || uf.equalsIgnoreCase(municipios.item(i).getChildNodes().item(2).getTextContent()))
		{
			//Verifica se o nome é similar ao nome do municipio atual, se for adiciona ao resultado final
			if(nome.equals("") || 
				nome.equalsIgnoreCase(municipios.item(i).getFirstChild().getTextContent().substring(0, comprimento)))
			{
				%><%="<municipio>"+municipios.item(i).getFirstChild().getTextContent()+"</municipio>"%><%
			}
		}
	}
%>
<%="</resultado>"%>
