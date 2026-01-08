<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card shadow-sm">
    <div class="card-header bg-warning text-white">
        <h5 class="mb-0">Cập nhật trạng thái hóa đơn</h5>
    </div>
    <div class="card-body">
        <form action="updateOrder" method="POST">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label fw-bold">Mã hóa đơn</label>
                    <input type="text" name="maHD" class="form-control" value="#HĐ001" readonly>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">Khách hàng</label>
                    <input type="text" name="tenKH" class="form-control" value="Nguyễn Văn A">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">Tổng tiền (VNĐ)</label>
                    <input type="number" name="tongTien" class="form-control" value="150000">
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">Trạng thái</label>
                    <select class="form-select" name="trangThai">
                        <option value="pending">Chờ xử lý</option>
                        <option value="confirmed">Đã xác nhận</option>
                        <option value="shipping">Đang giao</option>
                        <option value="done" selected>Hoàn thành</option>
                        <option value="cancel">Đã hủy</option>
                    </select>
                </div>
                <div class="col-12 mt-4 text-end">
                    <button type="submit" class="btn btn-primary px-4">Cập nhật</button>
                    <a href="admin-orders" class="btn btn-secondary px-4">Quay lại</a>
                </div>
            </div>
        </form>
    </div>
</div>