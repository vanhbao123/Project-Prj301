/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 *
 * @author dinhl
 */
public class RevenueReportServlet extends HttpServlet {

    OrderDAO dao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Double> revenueData = dao.getRevenueByMonth();
        request.setAttribute("revenueData", revenueData);
        // ====== NEW: Bảng thống kê tổng quan ======
        int totalOrders = dao.countApprovedOrders();    // tổng đơn đã duyệt
        int totalCustomers = dao.countTotalCustomers();  // tổng người dùng
        int totalProducts = dao.countTotalProducts();    // tổng sản phẩm
        double totalRevenue = dao.getTotalRevenue();     // tổng doanh thu

        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("/view/admin/revenue.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
