/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author DELL
 */
public class ProductDAO extends DBContext {

    public List<Product> findAll(int page) {
        // Khởi tạo một danh sách rỗng để lưu trữ các sản phẩm
        List<Product> list = new ArrayList<>();

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]"
                + "order by id\n"
                + "offset ? ROWS\n"
                + "FETCH next ? rows only";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setObject(1, (page - 1) * constant.Constant.RECORD_PER_PAGE);
            statement.setObject(2, constant.Constant.RECORD_PER_PAGE);

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                // Tạo một đối tượng Product mới
                Product p = new Product();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Product
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));

                // Thêm đối tượng Product vào danh sách
                list.add(p);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findAll(): " + e.getMessage());

        }
        return list;
    }

    public Product findById(Product product) {
        // Câu lệnh SQL để chọn một sản phẩm với điều kiện là id
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE id = ?"; // Sử dụng tham số (?) để tránh lỗi SQL Injection

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);

            // Gán giá trị cho tham số (?) trong câu lệnh SQL
            // Lấy ID từ đối tượng product được truyền vào
            statement.setInt(1, product.getId());

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Vì ID là duy nhất, chúng ta chỉ cần kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                // Tạo một đối tượng Product mới
                Product p = new Product();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Product
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));

                // Trả về đối tượng sản phẩm đã tìm thấy
                return p;
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findById(): " + e.getMessage());
        }

        // Trả về null nếu không tìm thấy sản phẩm hoặc có lỗi xảy ra
        return null;
    }

    public List<Product> findByCategory(int categoryId, int page) {
        // Khởi tạo một danh sách rỗng để lưu trữ các sản phẩm
        List<Product> list = new ArrayList<>();

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product] where [categoryId] = ? "
                + "order by id\n"
                + "offset ? ROWS\n"
                + "FETCH next ? rows only";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            statement.setObject(2, (page - 1) * constant.Constant.RECORD_PER_PAGE);
            statement.setObject(3, constant.Constant.RECORD_PER_PAGE);

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                // Tạo một đối tượng Product mới
                Product p = new Product();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Product
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));

                // Thêm đối tượng Product vào danh sách
                list.add(p);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findByCategory(): " + e.getMessage());
            e.printStackTrace(); // Thêm dòng này để xem chi tiết lỗi
        }
        return list;
    }

    public List<Product> findByKeyWord(String keyword, int page) {
        // Khởi tạo một danh sách rỗng để lưu trữ các sản phẩm
        List<Product> list = new ArrayList<>();

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product] where [name] like ? "
                + "order by id\n"
                + "offset ? ROWS\n"
                + "FETCH next ? rows only";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setObject(1, "%" + keyword + "%");
            statement.setObject(2, (page - 1) * constant.Constant.RECORD_PER_PAGE);
            statement.setObject(3, constant.Constant.RECORD_PER_PAGE);
            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                // Tạo một đối tượng Product mới
                Product p = new Product();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Product
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));

                // Thêm đối tượng Product vào danh sách
                list.add(p);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findByKeyWord(): " + e.getMessage());
            e.printStackTrace(); // Thêm dòng này để xem chi tiết lỗi
        }
        return list;
    }

    public int findTotalByCategory(int categoryId) {

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "select count(*) from product\n"
                + "where categoryId = ?;";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {

                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findTotalByCategory(): " + e.getMessage());
            e.printStackTrace(); // Thêm dòng này để xem chi tiết lỗi
        }
        return 0;
    }

    public int findTotalByKeyword(String keyword) {

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "SELECT count(*) FROM [dbo].[Product] where [name] like ?";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            statement.setObject(1, "%" + keyword + "%");

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findTotalByKeyword(): " + e.getMessage());
            e.printStackTrace(); // Thêm dòng này để xem chi tiết lỗi
        }
        return 0;
    }

    public int findTotalProducts() {
        // Câu lệnh SQL để đếm tất cả các dòng trong bảng Product
        String sql = "SELECT count(*) FROM [dbo].[Product]";
        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();
            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            // Thực thi câu lệnh
            resultSet = statement.executeQuery();

            // Nếu có kết quả trả về
            while (resultSet.next()) {
                // Trả về số lượng (cột đầu tiên của kết quả)
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ xảy ra
            System.out.println("Error at ProductDAO.findTotalProducts(): " + e.getMessage());
        }
        // Trả về 0 nếu không tìm thấy sản phẩm nào hoặc có lỗi
        return 0;
    }

    public List<Product> findByPriceRange(float minPrice, float maxPrice, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE price BETWEEN ? AND ? "
                + "ORDER BY id "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setFloat(1, minPrice);
            statement.setFloat(2, maxPrice);
            statement.setInt(3, (page - 1) * constant.Constant.RECORD_PER_PAGE);
            statement.setInt(4, constant.Constant.RECORD_PER_PAGE);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product p = new Product();
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error at ProductDAO.findByPriceRange(): " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public int findTotalByPriceRange(float minPrice, float maxPrice) {
        String sql = "SELECT COUNT(*) FROM Product WHERE price BETWEEN ? AND ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setFloat(1, minPrice);
            statement.setFloat(2, maxPrice);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1); // Trả về giá trị của cột đầu tiên (số lượng)
            }
        } catch (Exception e) {
            System.out.println("Error at ProductDAO.findTotalByPriceRange(): " + e.getMessage());
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi hoặc không tìm thấy
    }
    public List<Product> findAllProduct() {
        // Khởi tạo một danh sách rỗng để lưu trữ các sản phẩm
        List<Product> list = new ArrayList<>();

        // Câu lệnh SQL để chọn tất cả các cột từ bảng Products
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            

            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                // Tạo một đối tượng Product mới
                Product p = new Product();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Product
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setImage(resultSet.getString("image"));
                p.setQuantity(resultSet.getInt("quantity"));
                p.setPrice(resultSet.getFloat("price"));
                p.setDescription(resultSet.getString("description"));
                p.setCategoryId(resultSet.getInt("categoryId"));

                // Thêm đối tượng Product vào danh sách
                list.add(p);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at ProductDAO.findAll(): " + e.getMessage());

        }
        return list;
    }

    public void insertProduct(Product pro) {
        // Câu lệnh SQL để chèn dữ liệu vào bảng Product
        // Các cột được liệt kê rõ ràng để đảm bảo đúng thứ tự
        String sql = "INSERT INTO [dbo].[Product] ([name], [image], [quantity], [price], [description], [categoryId]) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();
            
            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            
            // Gán giá trị từ đối tượng Product vào các tham số '?'
            statement.setString(1, pro.getName());
            statement.setString(2, pro.getImage());
            statement.setInt(3, pro.getQuantity());
            statement.setFloat(4, pro.getPrice());
            statement.setString(5, pro.getDescription());
            statement.setInt(6, pro.getCategoryId());
            
            // Thực thi câu lệnh INSERT
            statement.executeUpdate();
            
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ xảy ra để dễ dàng gỡ rối
            System.out.println("Error at ProductDAO.insertProduct(): " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void deleteProductById(int id) {
        // Câu lệnh SQL để xóa một sản phẩm dựa trên ID của nó
        String sql = "DELETE FROM [dbo].[Product] WHERE id = ?";
        
        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();
            
            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            
            // Gán giá trị ID cho tham số '?'
            statement.setInt(1, id);
            
            // Thực thi câu lệnh DELETE
            statement.executeUpdate();
            
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ xảy ra để dễ dàng gỡ rối
            System.out.println("Error at ProductDAO.deleteProductById(): " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void editProduct(Product pro) {
        // Câu lệnh SQL để cập nhật thông tin sản phẩm dựa vào ID
        
        String sql = "UPDATE [dbo].[Product] SET "
                + "[name] = ?, "
                + "[image] = ?, "
                + "[quantity] = ?, "
                + "[price] = ?, "
                + "[description] = ?, "
                + "[categoryId] = ? "
                + "WHERE id = ?";
        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);

            // Gán giá trị từ đối tượng Product vào các tham số '?'
            statement.setString(1, pro.getName());
            statement.setString(2, pro.getImage());
            statement.setInt(3, pro.getQuantity());
            statement.setFloat(4, pro.getPrice());
            statement.setString(5, pro.getDescription());
            statement.setInt(6, pro.getCategoryId());
            statement.setInt(7, pro.getId()); // ID cho mệnh đề WHERE

            // Thực thi câu lệnh UPDATE
            statement.executeUpdate();

        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ xảy ra để dễ dàng gỡ rối
            System.out.println("Error at ProductDAO.editProduct(): " + e.getMessage());
            e.printStackTrace();
        }
    }
    public void updateProductQuantity(int productId, int newQuantity) {
    String sql = "UPDATE [dbo].[Product] SET [quantity] = ? WHERE [id] = ?";
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setInt(1, newQuantity);
        statement.setInt(2, productId);
        statement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // (BẮT BUỘC PHẢI CÓ)
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

}
