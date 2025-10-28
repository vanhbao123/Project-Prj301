/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author DELL
 */
public class AccountDAO extends DBContext {
    // ✅ Lấy Top 3 khách hàng mua nhiều nhất

    public List<Account> getTop3BestCustomers() {
        List<Account> list = new ArrayList<>();
        String sql = """
            SELECT TOP 3 
                a.id, a.username, a.email, a.address, SUM(o.amount) AS totalSpent
            FROM Account a
            JOIN [Order] o ON a.id = o.accountId
            WHERE o.status = N'Đã duyệt'
            GROUP BY a.id, a.username, a.email, a.address
            ORDER BY SUM(o.amount) DESC
        """;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Account acc = new Account(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        null, // password không cần
                        resultSet.getString("email"),
                        resultSet.getString("address"),
                        0 // roleId không cần
                );
                list.add(acc);
            }

        } catch (Exception e) {
            System.err.println("❌ Lỗi trong getTop3BestCustomers: " + e.getMessage());
        } finally {
            closeResources();
        }
        return list;
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

    public Account findUserByNameAndPassword(String username, String password) {
        // Câu lệnh SQL để chọn một tài khoản với điều kiện là username và password
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[address]\n"
                + "      ,[roleId]\n"
                + "  FROM [Account]\n"
                + "  WHERE [username] = ? AND [password] = ?";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu (theo mẫu)
            connection = getConnection();

            // Chuẩn bị câu lệnh SQL (theo mẫu)
            statement = connection.prepareStatement(sql);

            // Gán giá trị cho các tham số (?) trong câu lệnh SQL
            statement.setString(1, username);
            statement.setString(2, password);

            // Thực thi câu lệnh và nhận kết quả (theo mẫu)
            resultSet = statement.executeQuery();

            // Kiểm tra xem có kết quả nào không
            if (resultSet.next()) {
                // Tạo một đối tượng Account mới
                Account a = new Account();

                // Đọc dữ liệu từ ResultSet và gán cho đối tượng Account
                // Dựa trên ảnh schema bạn cung cấp
                a.setId(resultSet.getInt("id"));
                a.setName(resultSet.getString("username"));
                a.setPassword(resultSet.getString("password"));
                a.setEmail(resultSet.getString("email"));
                a.setAddress(resultSet.getString("address"));
                a.setRoleId(resultSet.getInt("roleId")); // Tên cột trong ảnh là roleId

                // Trả về đối tượng tài khoản đã tìm thấy
                return a;
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Lỗi tại findUserByNameAndPassword: " + e.getMessage());
            e.printStackTrace(); // In chi tiết lỗi để gỡ lỗi
        }

        // Trả về null nếu không tìm thấy tài khoản hoặc có lỗi xảy ra
        return null;
    }

    public boolean isExistUserName(String username) {
        // Câu lệnh SQL để tìm một tài khoản chỉ dựa trên username
        String sql = "SELECT [username] FROM [Account] WHERE [username] = ?";

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

            // Nếu resultSet.next() là true, nghĩa là tìm thấy ít nhất 1 bản ghi
            if (resultSet.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Lỗi tại isExistUserName: " + e.getMessage());
            e.printStackTrace();
        }

        // Trả về false nếu không tìm thấy hoặc có lỗi
        return false;
    }

    public void insertAccount(Account account) {
        // Câu lệnh SQL INSERT
        // Chú ý: Cột [id] là tự tăng (identity) nên không cần chèn
        String sql = "INSERT INTO [Account] ([username], [password], [email], [address], [roleId]) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);

            // Gán giá trị từ đối tượng Account cho các tham số (?)
            // Lưu ý: Model của bạn dùng 'name', nhưng DB dùng 'username'
            statement.setString(1, account.getName());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setString(4, account.getAddress());
            statement.setInt(5, 2);

            // Thực thi câu lệnh (dùng executeUpdate cho INSERT, UPDATE, DELETE)
            statement.executeUpdate();

        } catch (Exception e) {
            System.out.println("Lỗi tại insertAccount: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Account> getAllAccounts() {
        List<Account> listAccounts = new ArrayList<>();
        String sql = "select *from Account";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Account a = new Account();
                a.setId(resultSet.getInt("id"));
                a.setName(resultSet.getString("username"));
                a.setPassword(resultSet.getString("password"));
                a.setEmail(resultSet.getString("email"));
                a.setAddress(resultSet.getString("address"));
                a.setRoleId(resultSet.getInt("roleId"));
                listAccounts.add(a);
            }
        } catch (Exception e) {
            System.out.println("Error at getallaccounts:" + e.getMessage()
            );
            e.printStackTrace();
        }
        return listAccounts;
    }

    //delete by id 
    public void deleteById(String id) {
        String sql = "delete from Account where id=?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error at delete account:" + e.getMessage());
            e.printStackTrace();
        }
    }

}
