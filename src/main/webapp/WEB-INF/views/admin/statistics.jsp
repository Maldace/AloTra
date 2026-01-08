<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="m-0 fw-bold text-primary text-uppercase">Báo cáo & Thống kê</h4>
        <div class="d-flex gap-2">
            <select class="form-select form-select-sm" style="width: 120px;">
                <option>Năm 2025</option>
                <option selected>Năm 2026</option>
            </select>
            <button class="btn btn-primary btn-sm"><i class="fa fa-download"></i> Xuất báo cáo</button>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 bg-white">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted mb-1 small uppercase">Hàng tồn kho</h6>
                        <h3 class="mb-0 fw-bold">1,563</h3>
                        <small class="text-primary"><i class="fa fa-arrow-up"></i> 5% so với tháng trước</small>
                    </div>
                    <div class="bg-primary bg-opacity-10 p-3 rounded text-primary">
                        <i class="fa fa-boxes-stacked fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 bg-white">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted mb-1 small uppercase">Tổng doanh số</h6>
                        <h3 class="mb-0 fw-bold">30.5M</h3>
                        <small class="text-success"><i class="fa fa-arrow-up"></i> 12%</small>
                    </div>
                    <div class="bg-success bg-opacity-10 p-3 rounded text-success">
                        <i class="fa fa-coins fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 bg-white">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted mb-1 small uppercase">Khách hàng mới</h6>
                        <h3 class="mb-0 fw-bold">426</h3>
                        <small class="text-warning"><i class="fa fa-user-plus"></i> +15 hôm nay</small>
                    </div>
                    <div class="bg-warning bg-opacity-10 p-3 rounded text-warning">
                        <i class="fa fa-users fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 bg-white">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted mb-1 small uppercase">Nhà cung cấp</h6>
                        <h3 class="mb-0 fw-bold">18</h3>
                        <small class="text-muted">Đang hoạt động</small>
                    </div>
                    <div class="bg-danger bg-opacity-10 p-3 rounded text-danger">
                        <i class="fa fa-truck-ramp-box fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-4">
        <div class="col-md-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-dark">Phân tích doanh thu từng tháng</h6>
                </div>
                <div class="card-body">
                    <canvas id="revenueChart" style="min-height: 300px;"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-white py-3">
                    <h6 class="m-0 fw-bold text-dark">Tỷ trọng theo danh mục</h6>
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
                        <tr>
                            <td>Trà sữa Olong</td>
                            <td>Kho Miền Nam</td>
                            <td>850</td>
                            <td>120</td>
                            <td class="fw-bold">25,500,000đ</td>
                        </tr>
                        <tr>
                            <td>Trà sữa Matcha</td>
                            <td>Tổng kho Trà</td>
                            <td>420</td>
                            <td>45</td>
                            <td class="fw-bold">13,200,000đ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    // 1. Biểu đồ đường (Doanh thu)
    const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
    new Chart(ctxRevenue, {
        type: 'line',
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
            datasets: [{
                label: 'Doanh thu (triệu đồng)',
                data: [15, 25, 18, 35, 30, 45],
                borderColor: '#4e73df',
                backgroundColor: 'rgba(78, 115, 223, 0.1)',
                fill: true,
                tension: 0.4 // Làm mượt đường cong giống mẫu Admindek
            }]
        }
    });

    // 2. Biểu đồ tròn (Danh mục)
    const ctxCategory = document.getElementById('categoryChart').getContext('2d');
    new Chart(ctxCategory, {
        type: 'doughnut',
        data: {
            labels: ['Trà sữa', 'Cà phê', 'Đồ ăn vặt'],
            datasets: [{
                data: [60, 25, 15],
                backgroundColor: ['#4e73df', '#1cc88a', '#f6c23e']
            }]
        },
        options: { cutout: '70%' }
    });
</script>