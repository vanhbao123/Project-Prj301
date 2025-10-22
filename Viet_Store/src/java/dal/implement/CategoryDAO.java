/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author DELL
 */
public class CategoryDAO extends DBContext{
     public List<Category> findAll() {
        // Khởi tạo một danh sách rỗng để lưu trữ các danh mục
        List<Category> list = new ArrayList<>();
        
        // Câu lệnh SQL để chọn tất cả các cột từ bảng Categories
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";

        try {
            // Thiết lập kết nối đến cơ sở dữ liệu
            connection = getConnection();
            
            // Chuẩn bị câu lệnh SQL
            statement = connection.prepareStatement(sql);
            
            // Thực thi câu lệnh và nhận kết quả
            resultSet = statement.executeQuery();

            // Lặp qua từng dòng kết quả trả về
            while (resultSet.next()) {
                // Tạo một đối tượng Category mới từ dữ liệu lấy được
                Category c = new Category(
                        resultSet.getInt("id"),
                        resultSet.getString("name")
                );
                
                // Thêm đối tượng Category vào danh sách
                list.add(c);
            }
        } catch (Exception e) {
            // In ra lỗi nếu có ngoại lệ SQL xảy ra
            System.out.println("Error at CategoryDAO.findAll(): " + e.getMessage());
        }
        return list;
}
}
