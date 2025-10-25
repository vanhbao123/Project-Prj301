/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Account;

/**
 *
 * @author dinhl
 */
public class AccountManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action") == null ? "list" : request.getParameter("action");
        AccountDAO accountDAO = new AccountDAO();
        switch (action) {
            case "delete":
                String id = request.getParameter("id");
                accountDAO.deleteById(id);
                response.sendRedirect("accounts");
                break;
            default:
                List<Account> listAccounts = accountDAO.getAllAccounts();
                request.setAttribute("listAccounts", listAccounts);
                request.getRequestDispatcher("../view/admin/manageAccounts.jsp").forward(request, response);
                break;
        }
    }

}
