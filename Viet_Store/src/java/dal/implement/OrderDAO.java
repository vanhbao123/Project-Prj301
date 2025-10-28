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
import java.sql.*;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext {
    // === 1️⃣ Lấy toàn bộ đơn hàng (Admin) ===

    // Đếm tổng đơn hàng đã duyệt
    public int countApprovedOrders() {
        String sql = "SELECT COUNT(*) FROM [Order] WHERE status = N'Đã duyệt'";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi countApprovedOrders: " + e.getMessage());
        }
        return 0;
    }

// Đếm tổng người dùng
    public int countTotalCustomers() {
        String sql = "SELECT COUNT(*) FROM Account WHERE roleId = 2"; // 2: khách hàng
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi countTotalCustomers: " + e.getMessage());
        }
        return 0;
    }

// Đếm tổng sản phẩm
    public int countTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Product";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi countTotalProducts: " + e.getMessage());
        }
        return 0;
    }

// Tổng doanh thu tất cả đơn đã duyệt
    public double getTotalRevenue() {
        String sql = "SELECT SUM(amount) FROM [Order] WHERE status = N'Đã duyệt'";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi getTotalRevenue: " + e.getMessage());
        }
        return 0;
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = """
        SELECT o.id, o.amount, o.accountId, o.createAt, o.status,
               a.username AS accountName, a.email, a.address
        FROM [Order] o
        JOIN [Account] a ON o.accountId = a.id
        ORDER BY o.createAt DESC
    """;

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setAmount(rs.getInt("amount"));
                o.setAccountId(rs.getInt("accountId"));
                o.setCreateAt(rs.getTimestamp("createAt"));
                o.setStatus(rs.getString("status"));
                o.setAccountName(rs.getString("accountName"));
                o.setEmail(rs.getString("email"));
                o.setAddress(rs.getString("address"));
                list.add(o);
            }

        } catch (SQLException e) {
            System.err.println("❌ Error at getAllOrders(): " + e.getMessage());
        }

        return list;
    }

    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE [Order] SET status = ? WHERE id = ?";
        boolean updated = false;

        try {
            connection = getConnection(); // 🔹 Mở kết nối trước khi dùng
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();
            updated = rows > 0; // kiểm tra có dòng nào bị ảnh hưởng không
            System.out.println("✅ Update status orderId=" + orderId + " → " + status + " (" + rows + " row(s))");
        } catch (Exception e) {
            System.err.println("❌ Error at updateOrderStatus(): " + e.getMessage());
        } finally {
            closeResources();
        }

        return updated;
    }

    public Map<String, Double> getRevenueByMonth() {
        Map<String, Double> revenueMap = new LinkedHashMap<>();
        String sql = """
            SELECT FORMAT(o.createAt, 'MM-yyyy') AS Month, SUM(o.amount) AS Total
            FROM [Order] o
            WHERE o.status = N'Đã duyệt'
            GROUP BY FORMAT(o.createAt, 'MM-yyyy')
            ORDER BY MIN(o.createAt)
        """;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String month = resultSet.getString("Month");
                double revenue = resultSet.getDouble("Total");
                revenueMap.put(month, revenue);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi trong getRevenueByMonth: " + e.getMessage());
        } finally {
            closeResources();
        }
        return revenueMap;
    }

    private void closeResources() {
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
            System.err.println(" Lỗi khi đóng tài nguyên AccountDAO: " + e.getMessage());
        }
    }

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
                order.setStatus(resultSet.getString("status"));

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

    public boolean hasUserPurchasedProduct(int accountId, int productId) {
        // Sử dụng tên bảng và cột từ schema của bạn
        String sql = "SELECT 1 "
                + "FROM [Order] o "
                + // Bảng Order của bạn
                "JOIN OrderDetails od ON o.id = od.orderId "
                + // Join với OrderDetails
                "WHERE o.accountId = ? AND od.productId = ? ";
        // Chỉ cần kiểm tra accountId và productId

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, accountId);
            statement.setInt(2, productId);
            resultSet = statement.executeQuery();

            // Nếu tìm thấy bất kỳ dòng nào (resultSet.next() == true), nghĩa là đã mua.
            return resultSet.next();

        } catch (SQLException e) {
            System.err.println("Lỗi khi kiểm tra lịch sử mua hàng: " + e.getMessage());
            e.printStackTrace();
            return false; // Mặc định là false nếu có lỗi
        } finally {
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
