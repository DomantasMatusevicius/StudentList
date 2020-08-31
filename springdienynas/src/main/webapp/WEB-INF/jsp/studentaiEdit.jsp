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
        <%
            Studentas value = (Studentas) request.getAttribute("value");
        %>
        <form method="POST" action="studentasSave">
         <%
            if (value != null) {
         %>
            <input type="hidden" name="id" value="<%=value.getId()%>">
         <%
            }
         %>
             <input name="vardas" value="<%=(value!=null)?value.getVardas():""%>">
             <input name="pavarde" value="<%=(value!=null)?value.getPavarde():""%>">
             <input name="elPastas" value="<%=(value!=null)?value.getElPastas():""%>">
             <input type="submit" value="save">
        </form>
        <hr>
        <a href="/">Back</a>

    </body>
</html>