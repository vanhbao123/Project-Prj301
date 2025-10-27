/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import constant.Constant;
import dal.implement.OrderDAO;
import dal.implement.ProductDAO;
import dal.implement.ReviewDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import model.Account;
import model.Product;
import model.Review;

/**
 *
 * @author DELL
 */
public class Product_Page_Controller extends HttpServlet {
    ProductDAO dao = new ProductDAO();
    ReviewDAO reviewDAO = new ReviewDAO();
    OrderDAO orderDAO = new OrderDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = new Product();
        product.setId(id);
        product = dao.findById(product);
        List<Review> listReviews = reviewDAO.getReviewsByProductId(id);
        boolean canReview = false; // Mặc định là không
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute(Constant.SESSION_ACCOUNT);
        
        if (account != null) {
            // Nếu user đã đăng nhập, kiểm tra xem họ đã mua sản phẩm này chưa
            canReview = orderDAO.hasUserPurchasedProduct(account.getId(), id);
        }
        request.setAttribute("product", product);
        request.setAttribute("listReviews", listReviews);
        request.setAttribute("canReview", canReview);
        request.getRequestDispatcher("view/homepage/product-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding(StandardCharsets.UTF_8.name());
    String productIdStr = "0"; // Giá trị mặc định
    
    try {
        // 1. Lấy dữ liệu từ form
        productIdStr = request.getParameter("productId");
        int productId = Integer.parseInt(productIdStr);
        String name = request.getParameter("reviewer-name");
        String comment = request.getParameter("review-comment");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // 2. TẠO ĐỐI TƯỢNG VÀ LƯU VÀO DB
        Review newReview = new Review();
        newReview.setProductId(productId);
        newReview.setCustomerName(name);
        newReview.setRating(rating);
        newReview.setComment(comment);

        reviewDAO.addReview(newReview); // Lưu vào CSDL

    } catch (Exception e) {
        e.printStackTrace();
        // (Nếu lỗi thì cũng redirect về trang chủ hoặc trang lỗi)
    }

    // 3. QUAN TRỌNG: Chuyển hướng (tải lại) trình duyệt về đúng trang sản phẩm đó
    // Điều này sẽ tự động gọi lại doGet, tải lại danh sách review mới
    response.sendRedirect("product-page?id=" + productIdStr);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
