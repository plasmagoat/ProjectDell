<%-- 
    Document   : Partner
    Created on : 09-Nov-2015, 11:50:09
    Author     : butwhole
--%>
<%@page import="java.util.List"%>
<%@page import="Domain.Campaign"%>
<%@page import="Domain.Partner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Partner Window</title>
    </head>
    <body>
        
        <% List<Campaign> CampData = (List<Campaign>) session.getAttribute("allCamp");
        %>
        <form action="navCon">
            <h1><button name="nav" value="NC" type="submit">New Camp</button></h1>
            <div id="contentarea">
                <h2>New Campaigns</h2>
                <table cellspacing="0">
                    <th>Campaign ID</th>
                    <th>Partner ID</th>
                    <th>Dell ID</th>
                    <th>Campaign approval</th>
                    <th>POE status</th>
                    <th>Last Changed</th>
                    <th>Comments</th>
                        <%                    for (Campaign c : CampData) {
                                out.print("<tr>"
                                        + "<td>" + c.getId() + "</td>"
                                        + "<td>" + c.getPid() + "</td>"
                                        + "<td>" + c.getDid() + "</td>"
                                        + "<td>" + c.getCampApproved() + "</td>"
                                        + "<td>" + c.getPoeApproved() + "</td>"
                                        + "<td>" + c.getDateChanged() + "</td>"
                                        + "<td><pre>" + c.getComment() + "</pre></td>"
                                        + "</tr>");
                            }
                        %>

                </table>
            </div>
            <input type="text" name="Cid" />
            <button name="nav" value="UP" type="submit">Upload POE</button>
            <button name="nav" value="D" type="submit">Details</button>
            <button name="nav" value="C" type="submit">Complete</button>
            <br>
            <a href="index.jsp">Log Out</a>
        </form>
    </body>
</html>
