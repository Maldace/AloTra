<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="m-0">Quản lý Đơn hàng</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><i class="fa fa-home"></i> Bảng điều khiển</li>
                <li class="breadcrumb-item active">Cập nhật hóa đơn</li>
            </ol>
        </nav>
    </div>

    <div class="card shadow-sm">
        <div class="card-header bg-warning text-white py-3">
            <h5 class="mb-0">Cập nhật trạng thái hóa đơn</h5>
        </div>
        <div class="card-body p-4">
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
                        <button type="submit" class="btn btn-primary px-4">
                            <i class="fa fa-save"></i> Cập nhật
                        </button>
                        <a href="admin-orders" class="btn btn-secondary px-4">
                            <i class="fa fa-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>