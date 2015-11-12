<%-- 
    Document   : PartnerViewPOE
    Created on : 12-Nov-2015, 12:24:20
    Author     : Whalecum
--%>
<%@page import="java.util.List"%>
<%@page import="Domain.POEDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% List<POEDetails> viewpoe = (List<POEDetails>) request.getSession().getAttribute("lust");
            ServletContext context = pageContext.getServletContext();
            String filePath = application.getRealPath(request.getServletPath());
            String id = request.getSession().getAttribute("CampId").toString();
            if (id == null || id.equals("")) {
                response.sendRedirect("PartnerFetch");
            } else {

                int derp = filePath.indexOf("/build/web/");
                String f = "/";

                if (derp == -1) {
                    f = "\\";
                    derp = filePath.indexOf("\\build\\web\\");
                }
                filePath = filePath.substring(0, derp) + f + "Poe" + f + id + f;
            }
        %>    

        <% for (POEDetails s : viewpoe) {
        %> <a href="<%= filePath + s.getDl()%>"><%= s.getDl() %></a><br>
        <%}%>
    </body>
</html>