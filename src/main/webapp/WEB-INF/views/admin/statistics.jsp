<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="m-0 fw-bold text-primary text-uppercase">Báo cáo & Thống kê</h4>
    </div>

		<form action="monthRevenue" method="post">
		<label for="month">Tháng</label>
  <select name="month" id="month">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>
  
  <label for="year">Năm</label>
  <select name="year" id="year">
    <c:forEach items="${years}" var="i" varStatus="st">
		    <option value="${i}">${i}</option>
	  </c:forEach>
  </select>
        <button class="btn btn-danger btn-sm"><i class="fa fa-trash">Tổng doanh thu theo tháng</i></button>
		</form>

		<form action="salesOfProduct" method="post">
		<label for="month">Tháng</label>
  <select name="month" id="month">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>
  
  <label for="year">Năm</label>
  <select name="year" id="year">
    <c:forEach items="${years}" var="i" varStatus="st">
		    <option value="${i}">${i}</option>
	  </c:forEach>
  </select>
  
  <label for="product">Sản phẩm</label>
  <select name="product" id="product">
    <c:forEach items="${products}" var="i" varStatus="st">
		    <option value="${i.id}">${i.name}</option>
	  </c:forEach>
  </select>
        <button class="btn btn-danger btn-sm"><i class="fa fa-trash">Doanh thu trong tháng theo sản phẩm</i></button>
        </form>
        
        <form action="saleBySupplier" method="post">
        <label for="month">Tháng</label>
  <select name="month" id="month">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>
  
  <label for="year">Năm</label>
  <select name="year" id="year">
    <c:forEach items="${years}" var="i" varStatus="st">
		    <option value="${i}">${i}</option>
	  </c:forEach>
  </select>
  
  <label for="supplier">Nhà cung cấp</label>
  <select name="supplier" id="supplier">
    <c:forEach items="${suppliers}" var="i" varStatus="st">
		    <option value="${i.id}">${i.name}</option>
	  </c:forEach>
  </select>
        <button class="btn btn-danger btn-sm"><i class="fa fa-trash">Doanh thu trong tháng theo nhà cung cấp</i></button>
        </form>
        
        <form action="SaleByBuyer" method="post">
        <label for="month">Tháng</label>
  <select name="month" id="month">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>
  
  <label for="year">Năm</label>
  <select name="year" id="year">
    <c:forEach items="${years}" var="i" varStatus="st">
		    <option value="${i}">${i}</option>
	  </c:forEach>
  </select>
  
        <label for="buyer">Người mua</label>
  <select name="buyer" id="buyer">
    <c:forEach items="${buyers}" var="i" varStatus="st">
		    <option value="${i.id}">${i.userName}</option>
	  </c:forEach>
  </select>
        <button class="btn btn-danger btn-sm"><i class="fa fa-trash">Doanh thu trong tháng theo người mua</i></button>
        </form>
    <div class="row mb-4">
        <div class="col-md-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-dark">Số lượng đã bán</h6>
                    <input type="text" class="form-control bg-light" value="${quantity}" readonly>
                </div>
                <div class="card-body">
                </div>
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
                    <c:forEach items="${bills}" var="i" varStatus="st">
                        <tr>
                            <td>${i.productName}</td>
                            <td>${i.buyerName}</td>
                            <td>${i.quantity}</td>
                            <td>${i.date}</td>
                            <td>${i.time}</td>
                            <td>${i.price}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
