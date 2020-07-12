<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String cpf = request.getParameter("txtCpf");
    String data = request.getParameter("dateAgendar");
    String area = request.getParameter("cmbArea");
    String medico = request.getParameter("cmbMedico");

    try {
        String banco = "jdbc:postgresql://localhost:5432/consultas";
        String usuario = "postgres";
        String senha = "postgres";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(banco, usuario, senha);
        PreparedStatement cmdSQL = conn.prepareStatement(
            "insert into consultas(cpf,data,area,medico) "
            + "values('"+cpf+"','"+data+"','"+area+"','"+medico+"');");
        cmdSQL.execute();

        conn.close();
        response.sendRedirect("agendar.jsp?sucesso=true");
    } catch(SQLException ex) {
        out.println("Erro de banco de dados: " + ex);
            response.sendRedirect("agendar.jsp?sucesso=false");
    }
%>