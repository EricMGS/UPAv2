<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UPA v2</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="excluir.css"
    </head>
    <body>   
        <header id="topnav">
            <h1 id="logo">U<span>P</span>A <span>v2</span></h1>
        </header>

        <section id="content">
            <h2>Deseja mesmo excluir?</h2>
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                out.println("<div id='opcoesExcluir'>");
                out.println("<a href=lista.jsp>Não</a>");
                out.println("<a href=excluido.jsp?id="+id+">Sim</a>");
                out.println("</div>");
            %>
    </body>
        </section>
        <footer id="footer"></footer>
        
        <nav id="sidenav">
            <div id="sidenav-content">
                <a href="agendar.jsp">Agendar consulta</a>
                <a href="lista.jsp">Consultas agendadas</a>
            </div>
            <div id="sidenav-iconbar">
                <div class="sidenav-icon"></div>
                <div class="sidenav-icon"></div>
                <div class="sidenav-icon"></div>
            </div>
        </nav>
    
        <div id="layer"></div>
    </body>
</html>