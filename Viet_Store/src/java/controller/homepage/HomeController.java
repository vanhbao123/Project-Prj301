/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Category;
import model.Page;
import model.Product;

/**
 *
 * @author DELL
 */
public class HomeController extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay list product
        Page page = new Page();
        List<Product> listProduct = findProduct(request, page);
        //lay list category
        List<Category> listCategory = categoryDAO.findAll();
        HttpSession session = request.getSession();
        session.setAttribute(constant.Constant.SESSION_PRODUCT, listProduct);
        session.setAttribute(constant.Constant.SESSION_CATEGORY, listCategory);
        request.setAttribute("page", page);
        request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private List<Product> findProduct(HttpServletRequest request, Page pagecontrol) {
        String pagecur = request.getParameter("page");
        int page = 1;
        try {
            page = Integer.parseInt(pagecur);
            if (page <= 0) {
                page = 1;
            }
        } catch (Exception e) {
        }
        String requestURL = request.getRequestURL().toString();
        String action = request.getParameter("search") == null ? "default" : request.getParameter("search");
        List<Product> listProduct;
        int totalRecord;

        switch (action) {
            case "category":
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                totalRecord = productDAO.findTotalByCategory(categoryId);
                listProduct = productDAO.findByCategory(categoryId, page);
                pagecontrol.setUrlParrtern(requestURL + "?search=category&categoryId=" + categoryId + "&");
                break;
            case "search-bar":

                String keyword = request.getParameter("keyword");
                totalRecord = productDAO.findTotalByKeyword(keyword);
                listProduct = productDAO.findByKeyWord(keyword, page);
                pagecontrol.setUrlParrtern(requestURL + "?search=search-bar&keyword=" + keyword + "&");
                break;
            case "price":
                String minPriceParam = request.getParameter("minPrice"); 
                String maxPriceParam = request.getParameter("maxPrice");
                float minPrice = Float.parseFloat(minPriceParam);
                float maxPrice = Float.parseFloat(maxPriceParam);

                totalRecord = productDAO.findTotalByPriceRange(minPrice, maxPrice);
                listProduct = productDAO.findByPriceRange(minPrice, maxPrice, page);
                pagecontrol.setUrlParrtern(requestURL + "?search=price&minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&");
                break;
            default:
                totalRecord = productDAO.findTotalProducts();
                listProduct = productDAO.findAll(page);
                pagecontrol.setUrlParrtern(requestURL + "?");

        }
        int totalPage = (totalRecord % constant.Constant.RECORD_PER_PAGE) == 0 ? (totalRecord / constant.Constant.RECORD_PER_PAGE) : (totalRecord / constant.Constant.RECORD_PER_PAGE) + 1;
        pagecontrol.setPage(page);
        pagecontrol.setTotalRecord(totalRecord);
        pagecontrol.setTotalPage(totalPage);

        return listProduct;
    }

}
