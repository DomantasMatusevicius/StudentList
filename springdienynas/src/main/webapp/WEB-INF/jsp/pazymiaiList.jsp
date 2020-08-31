<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="lt.bit.springdienynas.data.Studentas" %>
<%@page import="lt.bit.springdienynas.data.Pazymiai" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pazymiu list</title>
    </head>
    <body>
        <%
            Studentas studentas = (Studentas) request.getAttribute("studentas");
        %>
        Studento <%=studentas.getVardas()%> pazymiai:<br>
        <%
            List<Pazymiai> list = (List<Pazymiai>) request.getAttribute("list");
            double count;
            for (Pazymiai pazymiai : list) {
        %>
        <%=pazymiai.getData()%> <b><%=pazymiai.getPazymys()%></b>

        <hr>
        <%
            }
        %>

        <a href="/">Back</a>
    </body>
</html>
