<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="lt.bit.springdienynas.data.Studentas" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Studentu listas</title>
    </head>
    <body>
        <a href="vidurkis">Bendras pazymiu vidurkis</a><br>
        <br>

        <%
            List<Studentas> list = (List<Studentas>) request.getAttribute("list");
            for (Studentas studentas : list) {
        %>
        <%=studentas.getVardas()%> <%=studentas.getPavarde()%> <%=studentas.getElPastas()%> <%=studentas.getPazymiaiList()%>
        <a href="/studentaiEdit?id=<%=studentas.getId()%>">Edit</a>
        <a href="/studentaiDelete?id=<%=studentas.getId()%>">Delete</a>
        <a href="/pazymiaiList?studentasId=<%=studentas.getId()%>">Pazymiu lentele</a>
        <hr>
        <%
            }
        %>
        <a href="studentaiEdit">New</a>

    </body>
</html>