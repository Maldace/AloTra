<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    .report-form {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 15px;
        flex-wrap: wrap;
        background: #f8f9fa;
        padding: 10px;
        border-radius: 8px;
    }
    .report-form label {
        font-weight: 600;
        margin-bottom: 0;
    }
    .report-form select {
        padding: 4px 8px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }
    /* Sửa lỗi font chữ trong button */
    .btn-report {
        font-family: inherit;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }
</style>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="m-0 fw-bold text-primary text-uppercase">Báo cáo & Thống kê</h4>
    </div>

    <form action="monthRevenue" method="post" class="report-form">
        <label for="month">Tháng</label>
        <select name="month">
            <c:forEach var="m" begin="1" end="12">
                <option value="${m}">${m}</option>
            </c:forEach>
        </select>

        <label for="year">Năm</label>
        <select name="year">
            <c:forEach items="${years}" var="i">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-danger btn-sm btn-report">
            <i class="fa fa-search"></i> Xem tổng doanh thu
        </button>
    </form>

    <form action="salesOfProduct" method="post" class="report-form">
        <label>Tháng</label>
        <select name="month">
            <c:forEach var="m" begin="1" end="12"><option value="${m}">${m}</option></c:forEach>
        </select>
        <label>Năm</label>
        <select name="year">
            <c:forEach items="${years}" var="i"><option value="${i}">${i}</option></c:forEach>
        </select>
        <label>Sản phẩm</label>
        <select name="product">
            <c:forEach items="${products}" var="i">
                <option value="${i.id}">${i.name}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-danger btn-sm btn-report">
            <i class="fa fa-box"></i> Doanh thu theo sản phẩm
        </button>
    </form>

    <form action="saleBySupplier" method="post" class="report-form">
        <label>Tháng</label>
        <select name="month">
            <c:forEach var="m" begin="1" end="12"><option value="${m}">${m}</option></c:forEach>
        </select>
        <label>Năm</label>
        <select name="year">
            <c:forEach items="${years}" var="i"><option value="${i}">${i}</option></c:forEach>
        </select>
        <label>Nhà cung cấp</label>
        <select name="supplier">
        <c:forEach items="${suppliers}" var="i">
                <option value="${i.id}">${i.name}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-danger btn-sm btn-report">
            <i class="fa fa-truck"></i> Doanh thu theo NCC
        </button>
    </form>

    <form action="SaleByBuyer" method="post" class="report-form">
        <label>Tháng</label>
        <select name="month">
            <c:forEach var="m" begin="1" end="12"><option value="${m}">${m}</option></c:forEach>
        </select>
        <label>Năm</label>
        <select name="year">
            <c:forEach items="${years}" var="i"><option value="${i}">${i}</option></c:forEach>
        </select>
        <label>Người mua</label>
        <select name="buyer">
            <c:forEach items="${buyers}" var="i">
                <option value="${i.id}">${i.userName}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-danger btn-sm btn-report">
            <i class="fa fa-user"></i> Doanh thu theo người mua
        </button>
    </form>

    <div class="row mb-4">
        <div class="col-md-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-dark">Số lượng đã bán</h6>
                    <input type="text" class="form-control bg-light" value="${quantity}" readonly>
                </div>
                <div class="card-body"></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-dark">Doanh thu</h6>
                    <input type="text" class="form-control bg-light" value="${price}" readonly>
                </div>
                <div class="card-body d-flex align-items-center">
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white py-3">
            <h6 class="m-0 fw-bold text-dark">Chi tiết doanh số mặt hàng theo NCC</h6>
        </div>
        <div class="card-body p-0 text-center">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Mặt hàng</th>
                            <th>Nhà cung cấp</th>
                            <th>Số lượng bán</th>
                            <th>Tồn kho</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bills}" var="i">
                            <tr>
                            <td>${i.productName}</td>
                                <td>${i.buyerName}</td>
                                <td>${i.quantity}</td>
                                <td>${i.date}</td>
                                <td>${i.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>