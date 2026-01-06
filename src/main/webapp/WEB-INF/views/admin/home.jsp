<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="m-0">Sản phẩm <button class="btn btn-add btn-sm ms-2"><i class="fa fa-plus-circle"></i> Thêm mới</button></h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><i class="fa fa-home"></i> Bảng điều khiển</li>
                <li class="breadcrumb-item active">Sản phẩm</li>
            </ol>
        </nav>
    </div>

    <div class="card">
        <div class="card-header bg-white py-3">
            <h5 class="card-title mb-0">Danh sách (1)</h5>
        </div>
        <div class="card-body">
            <div class="row g-2 mb-3">
                <div class="col-md-3">
                    <input type="text" class="form-control form-control-sm" placeholder="Tên">
                </div>
                <div class="col-md-3">
                    <select class="form-select form-select-sm">
                        <option>Chọn danh mục</option>
                    </select>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-warning btn-sm text-white w-100"><i class="fa fa-search"></i></button>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-light btn-sm border w-100"><i class="fa-solid fa-arrows-rotate"></i></button>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered align-middle text-center">
                    <thead class="table-light">
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Giá</th>
                            <th>Hàng tồn kho</th>
                            <th>Mã hàng</th>
                            <th>Nhà cung cấp</th>
                            <th>Ảnh</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td class="text-start">38000đ</td>
                            <td>Trà sửa olong</td>
                            <td></td>
                            <td><i class="fa-solid "></i></td>
                            <td><i class="fa-solid "></i></td>
                            <td><i class="fa-solid"></i></td>
                            <td>
                                <button class="btn btn-warning btn-sm text-white"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button class="btn btn-danger btn-sm">Xóa hết</button>
        </div>
    </div>
</div>