<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="lt.bit.springdienynas.data.Studentas" %>
<%@page import="lt.bit.springdienynas.data.Pazymiai" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vidurkis</title>
    </head>
    <body>


            <h2>Bendras studentu vidurkis: <b><%=request.getAttribute("vidurkis")%></b></h2> <br>

        <a href="/">Back</a>
    </body>
</html>