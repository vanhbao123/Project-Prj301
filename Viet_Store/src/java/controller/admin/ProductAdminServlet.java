/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import model.Product;

@MultipartConfig
/**
 *
 * @author DELL
 */
public class ProductAdminServlet extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    CategoryDAO cdao = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        switch (action) {
            case "add":
                addProduct(request, response);
                break;
            case "delete":
                
                deleteProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            default:

        }
        response.sendRedirect("admin-home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("category"));
            Part part = request.getPart("image");
            String pathOfFile = null;
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty() || part == null) {
                
            }
            else{
                String path = request.getServletContext().getRealPath("/img/products/images");
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File image = new File(dir, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                pathOfFile ="/images/" + image.getName();
            }

            Product pro = new Product();
            pro.setName(name);
            pro.setPrice(price);
            pro.setQuantity(quantity);
            pro.setDescription(description);
            pro.setCategoryId(categoryId);
            pro.setImage(pathOfFile);
            pdao.insertProduct(pro);

        } catch (IOException | NumberFormatException | ServletException e) {
            e.printStackTrace();
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        pdao.deleteProductById(id);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("Received id: " + request.getParameter("id"));
        System.out.println("Received name: " + request.getParameter("name"));
        System.out.println("Received price: " + request.getParameter("price"));
        System.out.println("Received quantity: " + request.getParameter("quantity"));
        System.out.println("Received description: " + request.getParameter("description"));
        System.out.println("Received category ID from form: " + request.getParameter("category")); // Dòng quan trọng nhất!
        System.out.println("Received currentImage path: " + request.getParameter("currentImage"));
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("category"));
            Part part = request.getPart("image");
            String pathOfFile = null;
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty() || part == null) {
                String fullPath = request.getParameter("currentImage");
                String correctPrefix = "/images/";
                int startIndex = fullPath.indexOf(correctPrefix);
                pathOfFile = fullPath.substring(startIndex);
            }
            else{
                String path = request.getServletContext().getRealPath("/img/products/images");
                File dir = new File(path);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File image = new File(dir, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                pathOfFile ="/images/" + image.getName();
            }

            Product pro = new Product();
            pro.setId(id);
            pro.setName(name);
            pro.setPrice(price);
            pro.setQuantity(quantity);
            pro.setDescription(description);
            pro.setCategoryId(categoryId);
            pro.setImage(pathOfFile);
            pdao.editProduct(pro);

        } catch (IOException | NumberFormatException | ServletException e) {
            e.printStackTrace();
        }
    }

}
