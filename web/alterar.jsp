<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UPA v2</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="alterar.css">
    </head>
    <body>   
        <header id="topnav">
            <h1 id="logo">U<span>P</span>A <span>v2</span></h1>
        </header>

        <section id="content">
            <h2>Alterar consulta</h2>
            
            <form id="frmAlterar" name="frmAlterar" action="alterado.jsp">
                <label for="txtId">ID</label>
                <input required readonly type="text"  name="txtId" id="txtId" value=<%=request.getParameter("id")%>>
                <label for="txtCpf">CPF</label>
                <input required type="text" maxlength="11" name="txtCpf" id="txtCpf" value=<%=request.getParameter("cpf")%>>
                <label for="dateAgendar">Data</label>
                <input required type="datetime-local" name="dateAgendar" id="dateAgendar"  value=<%=request.getParameter("data")%>>
                <label for="cmbArea">Area</label>
                <%! String select(String nome, String rq) {
                        if(nome.equals(rq))
                            return "selected";
                        else 
                            return "";
                    }
                %>
                <select required name="cmbArea" id="cmbArea">
                    <option <%out.println(select("Pediatria", request.getParameter("area")));%>>Pediatria</option>
                    <option <%out.println(select("Psicologia", request.getParameter("area")));%>>Psicologia</option>
                    <option <%out.println(select("Dermatologia", request.getParameter("area")));%>>Dermatologia</option>
                    <option <%out.println(select("Oftalmologia", request.getParameter("area")));%>>Oftalmologia</option>
                    <option <%out.println(select("Cirurgia", request.getParameter("area")));%>>Cirurgia</option>
                    <option <%out.println(select("Cardiologia", request.getParameter("area")));%>>Cardiologia</option>
                    <option <%out.println(select("Endoscopia", request.getParameter("area")));%>>Endoscopia</option>
                    <option <%out.println(select("Ginecologia", request.getParameter("area")));%>>Ginecologia</option>
                    <option <%out.println(select("Omeopatia", request.getParameter("area")));%>>Omeopatia</option>
                    <option <%out.println(select("Nutrição", request.getParameter("area")));%>>Nutrição</option>
                    <option <%out.println(select("Neurologia", request.getParameter("area")));%>>Neurologia</option>
                    <option <%out.println(select("Radiologia", request.getParameter("area")));%>>Radiologia</option>
                </select>
                <label for="cmbMedico">Medico</label>
                <select required name="cmbMedico" id="cmbMedico">
                    <option <%out.println(select("Aldemir Bueno", request.getParameter("medico")));%>>Aldemir Bueno</option>
                    <option <%out.println(select("Zuleide Costa", request.getParameter("medico")));%>>Zuleide Costa</option>
                    <option <%out.println(select("Beatriz Marcela", request.getParameter("medico")));%>>Beatriz Marcela</option>
                    <option <%out.println(select("Tales da Silva", request.getParameter("medico")));%>>Tales da Silva</option>
                    <option <%out.println(select("Otavio Souza", request.getParameter("medico")));%>>Otavio Souza</option>
                    <option <%out.println(select("Cleide Zucker", request.getParameter("medico")));%>>Cleide Zucker</option>
                </select>
                <input name="btnSubmit" type="submit" value="Alterar">
                <input name="btnSubmit" type="submit" value="Cancelar">
            </form>
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