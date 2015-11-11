/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PresentationDell;

import Domain.CampaignController;
import Domain.CampaignDetails;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Whalecum
 */
public class CampaignApproval extends HttpServlet{

    
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {
            
            CampaignController cc = new CampaignController();
            CampaignDetails derp = (CampaignDetails) request.getSession().getAttribute("currentCD");
            String s = request.getSession().getAttribute("id").toString();
            if(request.getParameter("poe").equals("Approve")){
                cc.campApprove(derp.getId(), request.getParameter("comment"),s);
            }
            if(request.getParameter("poe").equals("Reject")){
                cc.campReject(derp.getId(), request.getParameter("comment"),s);
            }
            response.sendRedirect("DellFetch");
        }
        catch (Exception ex) 
        {
            ex.printStackTrace();
            response.sendRedirect("index.jsp?msg=Error: "+ex.getMessage());
        }
    }
     
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
}