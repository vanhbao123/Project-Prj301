<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <%-- Đổi tiêu đề modal --%>
                <h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <%-- Đổi nội dung modal --%>
            <div class="modal-body">Chọn "Đăng xuất" bên dưới nếu bạn đã sẵn sàng kết thúc phiên làm việc hiện tại.</div>
            <div class="modal-footer">
                <%-- Đổi chữ nút Hủy --%>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                <%-- Đổi chữ nút Đăng xuất, giữ nguyên link --%>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a>
            </div>
        </div>
    </div>
</div>