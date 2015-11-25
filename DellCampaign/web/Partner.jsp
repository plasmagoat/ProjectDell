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
        <link rel="stylesheet" type="text/css" href="maincss.css">
        <title>Main Partner Window</title>
    </head>
    <body>

        <% List<Campaign> CampData = (List<Campaign>) session.getAttribute("allCamp");
           String Selected = request.getSession().getAttribute("Selected").toString();
           String count = "class=\"alt\"";
        %>
        <form action="navCon">
            <img class="delllogo" src="https://upload.wikimedia.org/wikipedia/commons/4/48/Dell_Logo.svg"/>
            <h1>&nbsp;Partner Campaigns</h1>
            <button id="NCB" class="button" name="nav" value="NC" type="submit">New Camp</button>
            <div id="contentarea">
                <h2>New Campaigns</h2>
                <table id="partner" cellspacing="0">
                    <th></th>
                    <th>Campaign ID</th>
                    <th>Partner ID</th>
                    <th>Dell ID</th>
                    <th>Campaign approval</th>
                    <th>POE status</th>
                    <th>Last Changed</th>
                    <th>Comments</th>
                        <%                    for (Campaign c : CampData) {
                            if(count.equals("class=\"alt\"")){
                                count = "";
                            }
                            else{
                                count = "class=\"alt\"";
                            }
                            if(Selected.equals(c.getId())){
                        %>
                    <tr bgcolor="red">
                        <td><button name="sel" value="<%=c.getId()%>" type="submit">Select</button></td>
                        <td><%= c.getId()%></td>
                        <td><%= c.getPid()%></td>
                        <td><%= c.getDid()%></td>
                        <td><%= c.getCampApproved()%></td>
                        <td><%= c.getPoeApproved()%></td>
                        <td><%= c.getDateChanged()%></td>
                        <td><%= c.getComment()%></td>
                    </tr>
                    <%} else{ %>
                    <tr <%=count%>>
                        <td><button name="sel" value="<%=c.getId()%>" type="submit">Select</button></td>
                        <td><%= c.getId()%></td>
                        <td><%= c.getPid()%></td>
                        <td><%= c.getDid()%></td>
                        <td><%= c.getCampApproved()%></td>
                        <td><%= c.getPoeApproved()%></td>
                        <td><%= c.getDateChanged()%></td>
                        <td><%= c.getComment()%></td>
                        
                    </tr>
                    <%}}%>

                </table>
            </div>
            <button name="nav" value="D" type="submit">Details</button>
            <button name="nav" value="UP" type="submit">Upload POE</button>
            <button name="nav" value="PD" type="submit">View POE</button>
            <button name="nav" value="Com" type="submit">Complete</button>
            <br>
            <a href="index.jsp">Log Out</a>
        </form>
    </body>
</html>
