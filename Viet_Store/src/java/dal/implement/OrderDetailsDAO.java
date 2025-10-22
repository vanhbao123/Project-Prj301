/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetails;

/**
 *
 * @author DELL
 */
public class OrderDetailsDAO extends DBContext{
    public void insertOrderDetails(OrderDetails odt) {
        // Câu lệnh SQL (đúng theo CSDL của bạn)
        String sql = "INSERT INTO [dbo].[OrderDetails] ([quantity], [productId], [orderId]) VALUES (?, ?, ?)";

        try {
            // Thiết lập kết nối (giống mẫu của bạn)
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);

            // Gán giá trị từ đối tượng OrderDetails vào các tham số '?'
            // (Giả sử model của bạn có các hàm get này)
            statement.setInt(1, odt.getQuantity());
            statement.setInt(2, odt.getProductId());
            statement.setInt(3, odt.getOrderId());

            // Thực thi câu lệnh INSERT
            statement.executeUpdate();

        } catch (Exception e) {
            // In ra lỗiもし có ngoại lệ (giống mẫu của bạn)
            System.out.println("Error at OrderDetailsDAO.insertOrderDetails(): " + e.getMessage());
            e.printStackTrace();
        } 
       
    }
    public List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
    List<OrderDetails> list = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[OrderDetails] WHERE [orderId] = ?";
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setInt(1, orderId);
        resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            OrderDetails od = new OrderDetails();
            od.setId(resultSet.getInt("id"));
            od.setQuantity(resultSet.getInt("quantity"));
            od.setProductId(resultSet.getInt("productId"));
            od.setOrderId(resultSet.getInt("orderId"));
            list.add(od);
        }
    } catch (Exception e) {
        System.out.println("Error at OrderDetailsDAO.getOrderDetailsByOrderId(): " + e.getMessage());
        e.printStackTrace();
    }
    // CẢNH BÁO: Không đóng kết nối!
    return list;
}

// === HÀM 2: Xóa chi tiết đơn hàng bằng orderId ===
// (Viết theo sườn code của bạn, không đóng kết nối)
public void deleteOrderDetailsByOrderId(int orderId) {
    String sql = "DELETE FROM [dbo].[OrderDetails] WHERE [orderId] = ?";
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setInt(1, orderId);
        statement.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error at OrderDetailsDAO.deleteOrderDetailsByOrderId(): " + e.getMessage());
        e.printStackTrace();
    }
    // CẢNH BÁO: Không đóng kết nối!
}
}
