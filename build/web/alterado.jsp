<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    if(request.getParameter("btnSubmit").equals("Cancelar")){
        response.sendRedirect("lista.jsp");
    } else {
        int id = Integer.parseInt(request.getParameter("txtId"));
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
                "update consultas set cpf='" + cpf + "', data='" + data + "', area='" + area +
                "', medico='" + medico + "' where id=" + id);
            cmdSQL.executeUpdate();

            conn.close();
            response.sendRedirect("lista.jsp?sucesso=true");
        } catch(SQLException ex) {
            out.println("Erro de banco de dados: " + ex);
                response.sendRedirect("lista.jsp?sucesso=false");
        }
    }
%>