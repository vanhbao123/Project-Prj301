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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import model.Account;
import model.Cart;
import model.Order;
import model.OrderDetails;
import model.Product;

/**
 *
 * @author DELL
 */
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("view/user/cart/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "add-product":
                addProduct(request, response);
                break;
            case "change-quantity":
                changeQuantity(request, response);
                break;
            case "delete-product":
                deleteProduct(request, response);
                break;
            case "check-out":
                checkOut(request, response);
                session.setAttribute("message", "Mua hàng thành công!");

                response.sendRedirect("home");
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("cart");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        OrderDetails odt = new OrderDetails();
        odt.setProductId(id);
        odt.setQuantity(quantity);
        addOrderDetailsToCart(odt, cart);
        session.setAttribute("cart", cart);
    }

    private void addOrderDetailsToCart(OrderDetails odt, Cart cart) {
        boolean isAdd = false;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if (obj.getProductId() == odt.getProductId()) {
                obj.setQuantity(obj.getQuantity() + odt.getQuantity());
                isAdd = true;
            }
        }
        if (isAdd == false) {
            cart.getListOrderDetails().add(odt);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            int pid = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            for (OrderDetails obj : cart.getListOrderDetails()) {
                if (obj.getProductId() == pid) {
                    obj.setQuantity(quantity);
                }
            }
            session.setAttribute("cart", cart);
        } catch (Exception e) {
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            int pid = Integer.parseInt(request.getParameter("id"));
            OrderDetails odt = new OrderDetails();
            for (OrderDetails obj : cart.getListOrderDetails()) {
                if (obj.getProductId() == pid) {
                    odt = obj;
                }
            }
            cart.getListOrderDetails().remove(odt);
            session.setAttribute("cart", cart);
        } catch (Exception e) {
        }
    }

    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();
        Cart cart = (Cart) session.getAttribute("cart");
        int accountId = ((Account) session.getAttribute(constant.Constant.SESSION_ACCOUNT)).getId();
        List<Product> listpro = (List<Product>) session.getAttribute(constant.Constant.SESSION_PRODUCT);
        int amount = calculateAmount(cart, listpro);
        Order order = new Order();
        order.setAmount(amount);
        order.setAccountId(accountId);
        order.setCreateAt(Timestamp.valueOf(LocalDateTime.now()));
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO orderdetaildao = new OrderDetailsDAO();
        int orderId = orderDAO.insertOrder(order);
        for (OrderDetails obj : cart.getListOrderDetails()) {
            obj.setOrderId(orderId);
            orderdetaildao.insertOrderDetails(obj);

            Product p = new Product();
            p.setId(obj.getProductId());
            p = productDAO.findById(p);
            int newQuantity = p.getQuantity() - obj.getQuantity();
            productDAO.updateProductQuantity(obj.getProductId(), newQuantity);
        }
        session.removeAttribute("cart");
    }

    private int calculateAmount(Cart cart, List<Product> list) {
        int amount = 0;
        for (OrderDetails od : cart.getListOrderDetails()) {
            amount += (od.getQuantity() * findPriceById(list, od.getProductId()));
        }
        return amount;
    }

    private float findPriceById(List<Product> list, int bookId) {
        for (Product obj : list) {
            if (obj.getId() == bookId) {
                return obj.getPrice();
            }
        }
        return 0;
    }

}
