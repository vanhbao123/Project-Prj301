/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.implement.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

/**
 *
 * @author DELL
 */
public class AuthenticationController extends HttpServlet {

    AccountDAO adao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        String url;
        switch (action) {
            case "login":
                url = "view/authentication/login.jsp";
                break;
            case "logout":
                url = logOut(request, response);
                break;
            case "register":
                url = "view/authentication/register.jsp";
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        String url;
        switch (action) {
            case "login":
                url = loginHandle(request, response);
                break;
            case "register":
                url = registerHandle(request, response);
                break;
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String loginHandle(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (adao.findUserByNameAndPassword(username, password) != null) {
            HttpSession session = request.getSession();
            session.setAttribute(constant.Constant.SESSION_ACCOUNT, adao.findUserByNameAndPassword(username, password));
            url = "home";
        } else {
            url = "view/authentication/login.jsp";
            request.setAttribute("error", "UserName or password is incorrect!");
        }

        return url;
    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(constant.Constant.SESSION_ACCOUNT);
        return "home";
    }

    private String registerHandle(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirm-password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        if (adao.isExistUserName(username)) {
            request.setAttribute("error", "UserName is exist please try another one!");
            return "view/authentication/register.jsp";
        }
        if (!password.equalsIgnoreCase(confirmpassword)) {
            request.setAttribute("error", "Password is not matching please enter again!");
            return "view/authentication/register.jsp";
        }
        Account account = new Account();
        account.setName(username);
        account.setPassword(password);
        account.setEmail(email);
        account.setAddress(address);
        adao.insertAccount(account);
        return "home";
    }

}
