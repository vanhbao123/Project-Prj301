<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document"> <%-- Thêm modal-lg để rộng hơn --%>
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm mới</h5> <%-- Việt hóa --%>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="product?action=add" method="POST" enctype="multipart/form-data">
                    <%-- Tên sản phẩm --%>
                    <div class="form-group">
                        <label for="nameInput">Tên sản phẩm:</label> <%-- Việt hóa & sửa for --%>
                        <input type="text" class="form-control" id="nameInput" name="name" required> <%-- Thêm required --%>
                        <div id="nameError" class="error"></div>
                    </div>
                    <%-- Giá --%>
                    <div class="form-group">
                        <label for="priceInput">Giá:</label> <%-- Việt hóa & sửa for --%>
                        <input type="number" class="form-control" id="priceInput" name="price" min="0" step="any" required> <%-- Đổi type="number", thêm min/step/required --%>
                        <div id="priceError" class="error"></div>
                    </div>
                    <%-- Số lượng --%>
                    <div class="form-group">
                        <label for="quantityInput">Số lượng:</label> <%-- Việt hóa & sửa for --%>
                        <input type="number" class="form-control" id="quantityInput" name="quantity" min="0" required> <%-- Đổi type="number", thêm min/required --%>
                        <div id="quantityError" class="error"></div>
                    </div>
                    <%-- Loại sách --%>
                    <div class="form-group">
                        <label for="category">Loại sách:</label> <%-- Việt hóa --%>
                        <select class="custom-select" id="category" name="category" required> <%-- Thêm required --%>
                            <option value="" disabled selected>-- Chọn loại sách --</option> <%-- Thêm option mặc định --%>
                            <c:forEach items="${listAdminCategory}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                         <%-- Bỏ nút Category thừa --%>
                    </div>
                    <%-- Ảnh --%>
                    <div class="form-group">
                        <label for="image">Ảnh:</label> <%-- Việt hóa --%>
                        <div class="custom-file">
                             <%-- Sửa id và name cho input file --%>
                            <input type="file" class="custom-file-input" id="imageInputFile" name="image" accept="image/*" onchange="displayImage(this)" required> <%-- Thêm accept/required --%>
                            <label class="custom-file-label" for="imageInputFile">Chọn tệp</label> <%-- Việt hóa & sửa for --%>
                        </div>
                        <div id="imageError" class="error"></div>
                         <%-- Xem trước ảnh --%>
                        <img id="previewImage" src="#" alt="Xem trước ảnh"
                             style="display: none; max-width: 200px; max-height: 200px; margin-top: 10px;"> <%-- Giảm kích thước preview --%>
                    </div>
                    <%-- Mô tả --%>
                    <div class="form-group">
                        <label for="description">Mô tả:</label> <%-- Việt hóa & thêm for --%>
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea> <%-- Thêm id và rows --%>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button> <%-- Việt hóa --%>
                 <%-- Sửa lại hàm validate nếu cần, hoặc bỏ onclick nếu validate bằng HTML5 --%>
                <button type="submit" class="btn btn-primary" form="addProductForm" >Thêm</button> <%-- Việt hóa & bỏ onclick nếu dùng HTML5 required --%>
            </div>
        </div>
    </div>
</div>

<%-- GIỮ NGUYÊN JAVASCRIPT --%>
<script>
    function validateForm(event) { // Thêm event vào tham số
        let name = $('#nameInput').val().trim(); // Thêm trim()
        let price = $('#priceInput').val();
        let quantity = $('#quantityInput').val();
        let category = $('#category').val(); // Thêm kiểm tra category
        let image = $('#imageInputFile').val(); // Thêm kiểm tra ảnh

        // Xóa thông báo lỗi hiện tại
        $('.error').html('');
        let isValid = true; // Biến kiểm tra tổng thể

        if (name === '') {
            $('#nameError').html('Tên sản phẩm không được để trống');
            isValid = false;
        }

        if (price === '') {
            $('#priceError').html('Giá không được để trống');
            isValid = false;
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('Giá phải là số không âm');
            isValid = false;
        }

        if (quantity === '') {
            $('#quantityError').html('Số lượng không được để trống');
             isValid = false;
        } else if (!/^\d+$/.test(quantity) || parseInt(quantity) < 0) { // Kiểm tra số nguyên không âm
             $('#quantityError').html('Số lượng phải là số nguyên không âm'); // Sửa lỗi #quantityError
             isValid = false;
        }

         if (!category) { // Kiểm tra category đã chọn chưa
            // Có thể thêm báo lỗi gần select category nếu muốn
             alert('Vui lòng chọn loại sách');
             isValid = false;
         }

         if (image === '') { // Kiểm tra đã chọn ảnh chưa
             $('#imageError').html('Vui lòng chọn ảnh sản phẩm');
             isValid = false;
         }

        // Ngăn submit nếu không hợp lệ
        if (!isValid) {
            event.preventDefault(); // Ngăn form submit
        }
        // Nếu hợp lệ, form sẽ tự submit (không cần else submit)
    }

    // Gắn sự kiện validate vào form submit thay vì nút bấm
    $('#addProductForm').on('submit', validateForm);


    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        // Cập nhật label của input file để hiển thị tên tệp
        var fileName = file ? file.name : "Chọn tệp";
        $(input).next('.custom-file-label').html(fileName);

        if (file) { // Chỉ đọc file nếu người dùng đã chọn
            var reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;
                previewImage.style.display = "block";
            }
            reader.readAsDataURL(file);
        } else { // Nếu không chọn file (ví dụ: nhấn cancel) thì ẩn preview
             previewImage.src = "#";
             previewImage.style.display = "none";
        }
    }
</script>