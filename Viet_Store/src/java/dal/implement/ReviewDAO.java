package dal.implement; 

import dal.DBContext;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Review;

public class ReviewDAO extends DBContext {


    public List<Review> getReviewsByProductId(int productId) {
        List<Review> list = new ArrayList<>();
        String sql = "SELECT * FROM Reviews WHERE productID = ? ORDER BY reviewDate DESC";
        
        try {
            // 1. Lấy connection từ class cha (DBContext)
            connection = getConnection(); 
            
            // 2. Dùng trường 'statement' (PreparedStatement) từ class cha
            statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            
            // 3. Dùng trường 'resultSet' từ class cha
            resultSet = statement.executeQuery();
            
            // 4. Đọc dữ liệu
            while (resultSet.next()) {
                Review r = new Review(
                        resultSet.getInt("id"),
                        resultSet.getInt("productID"),
                        resultSet.getString("customerName"),
                        resultSet.getInt("rating"),
                        resultSet.getString("comment"),
                        resultSet.getTimestamp("reviewDate")
                );
                list.add(r);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy danh sách review: " + e.getMessage());
            e.printStackTrace();
        } finally {
          
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối: " + e.getMessage());
            }
        }
        return list;
    }

    
    public boolean addReview(Review review) {
        String sql = "INSERT INTO Reviews (productID, customerName, rating, comment, reviewDate) "
                   + "VALUES (?, ?, ?, ?, ?)";
        
        try {
            // 1. Lấy connection
            connection = getConnection(); 
            
            // 2. Dùng 'statement'
            statement = connection.prepareStatement(sql);
            statement.setInt(1, review.getProductId());
            statement.setString(2, review.getCustomerName());
            statement.setInt(3, review.getRating());
            statement.setString(4, review.getComment());
            statement.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // Tự động lấy ngày giờ hiện tại
            
            // 3. Thực thi
            return statement.executeUpdate() > 0; // Trả về true nếu có > 0 dòng bị ảnh hưởng
            
        } catch (SQLException e) {
            System.err.println("Lỗi khi thêm review: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // 4. Đóng tài nguyên
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Lỗi khi đóng kết nối: " + e.getMessage());
            }
        }
    }
}
