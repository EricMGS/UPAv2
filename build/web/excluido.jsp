<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    try {
        String banco = "jdbc:postgresql:consultas";
        String usuario = "postgres";
        String senha = "postgres";
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(banco, usuario, senha);
        int id = Integer.parseInt(request.getParameter("id"));
        PreparedStatement cmdSQL = conn.prepareStatement("delete from consultas "+ "where id = " + id);
        cmdSQL.execute();

        response.sendRedirect("lista.jsp?excluir=true");
        conn.close();

    } catch(SQLException ex) {
        out.println("Erro de banco de dados: " + ex);
        response.sendRedirect("lista.jsp?excluir=false");
    }
%>
