<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true"> <%-- Sửa lại aria-labelledby --%>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Bạn muốn đăng xuất?</h5> <%-- Việt hóa --%>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Chọn "Đăng xuất" bên dưới nếu bạn đã sẵn sàng kết thúc phiên làm việc hiện tại.</div> <%-- Việt hóa --%>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button> <%-- Việt hóa --%>
                <%-- Giữ nguyên link đăng xuất --%>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a> <%-- Việt hóa --%>
            </div>
        </div>
    </div>
</div>