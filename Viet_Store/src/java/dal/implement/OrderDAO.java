/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.DBContext;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext{
    public int insertOrder(Order order) {
    // Câu lệnh SQL (Lưu ý [Order] và [amount] 1 chữ 'm')
    String sql = "INSERT INTO [dbo].[Order] ([amount], [accountId], [createAt]) VALUES (?, ?, ?)";

    try {
        // Thiết lập kết nối (giống mẫu của bạn)
        connection = getConnection();

        // Chuẩn bị câu lệnh SQL
        // *** Đây là điểm khác biệt duy nhất so với mẫu của bạn ***
        // Phải thêm "Statement.RETURN_GENERATED_KEYS" để lấy được ID
        statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // Gán giá trị từ đối tượng Order vào các tham số '?'
        statement.setInt(1, order.getAmount());
        statement.setInt(2, order.getAccountId());
        statement.setTimestamp(3, order.getCreateAt());

        // Thực thi câu lệnh INSERT
        int affectedRows = statement.executeUpdate();

        // --- Bổ sung logic để lấy ID (vẫn theo sườn của bạn) ---
        if (affectedRows > 0) {
            // Lấy ResultSet chứa các ID vừa được sinh ra
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID (là cột đầu tiên)
            }
        }
        // -----------------------------------------------------

    } catch (Exception e) {
        // In ra lỗiもし có ngoại lệ (giống mẫu của bạn)
        System.out.println("Error at OrderDAO.insertOrder(): " + e.getMessage());
        e.printStackTrace();
    }
    
    // Trả về -1 nếu có lỗi hoặc không chèn được
    return -1;
}
    public List<Order> getOrdersByAccountId(int accountId) {
    List<Order> list = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[Order] WHERE [accountId] = ? ORDER BY [createAt] DESC";

    try {
        // 1. Mở kết nối (giống mẫu của bạn)
        connection = getConnection();
        
        // 2. Chuẩn bị statement
        statement = connection.prepareStatement(sql);
        statement.setInt(1, accountId); // Gán tham số accountId

        // 3. Thực thi và lấy kết quả
        resultSet = statement.executeQuery(); // Dùng biến resultSet của DBContext

        // 4. Đọc dữ liệu từ ResultSet
        while (resultSet.next()) {
            Order order = new Order();
            order.setId(resultSet.getInt("id"));
            order.setAmount(resultSet.getInt("amount"));
            order.setAccountId(resultSet.getInt("accountId"));
            order.setCreateAt(resultSet.getTimestamp("createAt"));
            
            list.add(order); // Thêm vào danh sách
        }
    } catch (Exception e) {
        System.out.println("Error at OrderDAO.getOrdersByAccountId(): " + e.getMessage());
        e.printStackTrace();
    } finally {
        // 5. (RẤT QUAN TRỌNG) Phải đóng 3 thứ này
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("Error closing resources: " + e.getMessage());
            e.printStackTrace();
        }
    }
    return list;
}
    public void deleteOrderById(int orderId) {
    String sql = "DELETE FROM [dbo].[Order] WHERE [id] = ?";
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setInt(1, orderId);
        statement.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error at OrderDAO.deleteOrderById(): " + e.getMessage());
        e.printStackTrace();
    }
    // CẢNH BÁO: Không đóng kết nối!
}

// === HÀM 2: Lấy 1 đơn hàng bằng ID (để kiểm tra bảo mật) ===
// (Viết theo sườn code của bạn, không đóng kết nối)
public Order getOrderById(int orderId) {
    String sql = "SELECT * FROM [dbo].[Order] WHERE [id] = ?";
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setInt(1, orderId);
        
        resultSet = statement.executeQuery(); // Dùng biến resultSet của DBContext
        
        if (resultSet.next()) {
            Order order = new Order();
            order.setId(resultSet.getInt("id"));
            order.setAmount(resultSet.getInt("amount"));
            order.setAccountId(resultSet.getInt("accountId"));
            order.setCreateAt(resultSet.getTimestamp("createAt"));
            return order;
        }
    } catch (Exception e) {
        System.out.println("Error at OrderDAO.getOrderById(): " + e.getMessage());
        e.printStackTrace();
    }
    // CẢNH BÁO: Không đóng kết nối!
    return null;
}
}
