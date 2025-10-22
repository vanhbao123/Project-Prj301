/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Account;
import model.Order;
import model.OrderDetails;
import model.Product;

/**
 *
 * @author DELL
 */
public class UserHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int accountId = ((Account) session.getAttribute(constant.Constant.SESSION_ACCOUNT)).getId();
        OrderDAO dao = new OrderDAO();
        List<Order> list = dao.getOrdersByAccountId(accountId);
        request.setAttribute("listOrder", list);
        request.getRequestDispatcher("view/user/user-home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Account account = (Account) session.getAttribute(constant.Constant.SESSION_ACCOUNT);
        String action = request.getParameter("action");
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
        ProductDAO productDAO = new ProductDAO();
        if (action.equals("cancel-order")) {
            List<OrderDetails> detailsList = orderDetailsDAO.getOrderDetailsByOrderId(orderId);
            for (OrderDetails odt : detailsList) {
                Product p = new Product();
                p.setId(odt.getProductId());
                p = productDAO.findById(p);
                if (p != null) {
                    int newQuantity = p.getQuantity() + odt.getQuantity();
                    productDAO.updateProductQuantity(p.getId(), newQuantity);
                }
            }
            orderDetailsDAO.deleteOrderDetailsByOrderId(orderId);
            orderDAO.deleteOrderById(orderId);
            session.setAttribute("message", "Đã hủy thành công đơn hàng #" + orderId);
        }
        response.sendRedirect("user-home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
