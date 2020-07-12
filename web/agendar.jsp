<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UPA v2</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="agendar.css"
    </head>
    <body>   
        <header id="topnav">
            <h1 id="logo">U<span>P</span>A <span>v2</span></h1>
        </header>

        <section id="content">
            <h2>Agendar Consulta</h2>
            <form id="frmAgendar" name="frmAgendar" action="agendado.jsp">
                <label for="txtCpf">CPF</label>
                <input required type="text" maxlength="11" name="txtCpf" id="txtCpf">
                <label for="dateAgendar" >Data</label>
                <input required type="datetime-local" name="dateAgendar" id="dateAgendar">
                <label for="cmbArea">Area</label>
                <select name="cmbArea" id="cmbArea" required>
                    <option disabled selected value> -- Selecione uma opção -- </option>
                    <option>Pediatria</option>
                    <option>Psicologia</option>
                    <option>Dermatologia</option>
                    <option>Oftalmologia</option>
                    <option>Cirurgia</option>
                    <option>Cardiologia</option>
                    <option>Endoscopia</option>
                    <option>Ginecologia</option>
                    <option>Omeopatia</option>
                    <option>Nutrição</option>
                    <option>Neurologia</option>
                    <option>Radiologia</option>
                </select>
                <label for="cmbMedico">Médico</label>
                <select name="cmbMedico" id="cmbMedico" required>
                    <option disabled selected value> -- Selecione uma opção -- </option>
                    <option>Aldemir Bueno</option>
                    <option>Zuleide Costa</option>
                    <option>Beatriz Marcela</option>
                    <option>Tales da Silva</option>
                    <option>Otavio Souza</option>
                    <option>Cleide Zucker</option>
                </select>
                <input type="submit" value="Agendar">
            </form>
            <%
                try {
                    String sucesso = request.getParameter("sucesso");
                    if(sucesso.equals("true")) {
                        out.println("<p>Cadastrado com sucesso</p>");
                    }
                    else if(sucesso.equals("false")){
                        out.println("<p>Falha, não foi possível cadastrar</p>");
                    }
                } catch(Exception ex) {}
            %>
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