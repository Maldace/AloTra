<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="m-0 fw-bold"><i class="fa fa-file-invoice-dollar me-2 text-primary"></i>Quản lý đơn hàng</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0 bg-light p-2 rounded">
                <li class="breadcrumb-item"><i class="fa fa-home"></i> Bảng điều khiển</li>
                <li class="breadcrumb-item active">Đơn hàng</li>
            </ol>
        </nav>
    </div>

    <div class="card mb-4 shadow-sm border-0">
        <div class="card-body">
            <div class="row g-2">
                <div class="col-md-3">
                    <input type="text" class="form-control form-control-sm" placeholder="Mã đơn hàng hoặc Tên KH...">
                </div>
                <div class="col-md-2">
                    <select class="form-select form-select-sm">
                        <option selected disabled>Trạng thái</option>
                        <option value="1">Chờ xác nhận</option>
                        <option value="2">Đang giao</option>
                        <option value="3">Đã hoàn thành</option>
                        <option value="4">Đã hủy</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="date" class="form-control form-control-sm" title="Từ ngày">
                </div>
                <div class="col-md-1">
                    <button class="btn btn-warning btn-sm text-white w-100"><i class="fa fa-search"></i></button>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-light btn-sm border w-100"><i class="fa-solid fa-arrows-rotate"></i></button>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="card-title mb-0">Danh sách đơn hàng (5)</h5>
            <button class="btn btn-success btn-sm"><i class="fa fa-file-excel me-1"></i> Xuất Excel</button>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center mb-0">
                    <thead class="table-light">
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>Mã đơn</th>
                            <th class="text-start">Khách hàng</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="fw-bold text-primary">#DH-10024</td>
                            <td class="text-start">
                                <div>Nguyễn Văn A</div>
                                <small class="text-muted">0987.xxx.xxx</small>
                            </td>
                            <td>08/01/2026</td>
                            <td class="fw-bold text-danger">125.000đ</td>
                            <td>
                                <span class="badge bg-warning text-dark">Chờ xác nhận</span>
                            </td>
                            <td>
                                <button class="btn btn-info btn-sm text-white" title="Xem chi tiết"><i class="fa fa-eye"></i></button>
                                <button class="btn btn-success btn-sm" title="Xác nhận"><i class="fa fa-check"></i></button>
                                <button class="btn btn-danger btn-sm" title="Hủy đơn"><i class="fa fa-times"></i></button>
                            </td>
                        </tr>
                        </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer bg-white">
            <button class="btn btn-danger btn-sm">Xóa đơn hàng đã chọn</button>
        </div>
    </div>
</div>