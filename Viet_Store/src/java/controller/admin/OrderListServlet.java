package controller.admin;

import dal.implement.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Order;

public class OrderListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        OrderDAO orderDAO = new OrderDAO();

        // ✅ Nếu có action → xử lý cập nhật
        if (action != null && idParam != null) {
            int id = Integer.parseInt(idParam);
            String newStatus = null;

            if (action.equals("approve")) {
                newStatus = "Đã duyệt";
            } else if (action.equals("cancel")) {
                newStatus = "Đã hủy";
            }

            if (newStatus != null) {
                boolean ok = orderDAO.updateOrderStatus(id, newStatus);
                System.out.println("🟢 Cập nhật đơn #" + id + " → " + newStatus + " (" + ok + ")");
            }

            // Sau khi cập nhật xong, quay lại danh sách
            response.sendRedirect(request.getContextPath() + "/admin/OrderListServlet");
            return;
        }

        // ✅ Nếu không có action → hiển thị danh sách đơn
        List<Order> list = orderDAO.getAllOrders();
        request.setAttribute("listOrders", list);
        request.getRequestDispatcher("/view/admin/orderList.jsp").forward(request, response);
    }
}
