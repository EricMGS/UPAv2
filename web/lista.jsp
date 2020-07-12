<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UPA v2</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="lista.css"
    </head>
    <body>
        <header id="topnav">
            <h1 id="logo">U<span>P</span>A <span>v2</span></h1>
        </header>

        <section id="content">
            <h2>Consultas agendadas</h2>
            <table>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>CPF</th>
                        <th>Data</th>
                        <th>Area</th>
                        <th>Médico</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try {
                        String banco = "jdbc:postgresql:consultas";
                        String usuario = "postgres";
                        String senha = "postgres";
                        Class.forName("org.postgresql.Driver");
                        Connection conn = DriverManager.getConnection(banco, usuario, senha);
                        PreparedStatement cmdSQL = conn.prepareStatement("select * from consultas order by data");
                        ResultSet rs = cmdSQL.executeQuery();
                        
                        int id;
                        String cpf, data, area, medico;
                        
                        if (rs.next() == false) {
                            out.println("<br> Nenhuma consulta agendada. <br>");
                        } else {
                            do {
                                id = rs.getInt("id");
                                cpf = rs.getString("cpf");
                                data = rs.getString("data");
                                data = data.replace("T", " ");
                                area = rs.getString("area");
                                medico = rs.getString("medico");
                                out.println("<tr>");
                                out.println("<td>" + id + "</td>");
                                out.println("<td>" + cpf + "</td>");
                                out.println("<td>" + data + " </td>");
                                out.println("<td>" + area + "</td>");
                                out.println("<td>" + medico + "</td>");
                                medico = medico.replaceAll(" ", "+");
                                data = data.replace(" ", "T");
                                String parametros = "id="+id+"&cpf="+cpf+"&data="+data+"&area="+area+"&medico="+medico;
                                out.println("<td><a href=alterar.jsp?" + parametros + ">Alterar</a></td>");
                                out.println("<td><a href=excluir.jsp?" + parametros + ">Excluir</a></td>");
                                out.println("</tr>" );
                            } while(rs.next());
                        }

                        rs.close();

                        conn.close();
                    } catch(SQLException ex) {
                        out.println("Erro de banco de dados: " + ex);
                    }
                %>  
                </tbody>
            </table>
            <%
                try {
                    String sucesso = request.getParameter("sucesso");
                    if(sucesso.equals("true")) {
                        out.println("<p>Alterado com sucesso</p>");
                    }
                    else if(sucesso.equals("false")){
                        out.println("<p>Falha, não foi possível alterar</p>");
                    }
                } catch(Exception ex) {}

                try {
                    String excluir = request.getParameter("excluir");
                    if(excluir.equals("true")) {
                        out.println("<p>Excluído com sucesso</p>");
                    }
                    else if(excluir.equals("false")){
                        out.println("<p>Falha, não foi possível excluir</p>");
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