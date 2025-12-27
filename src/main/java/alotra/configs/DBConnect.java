package alotra.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    // Cấu hình DB
<<<<<<< HEAD
    private static final String serverName = "DESKTOP-FB0Q68I";
    private static final String instance = "MSSQLSERVER2022"; // nếu default instance thì để trống ""
=======
    private static final String serverName = "Hades";
    private static final String instance = ""; // nếu default instance thì để trống ""
>>>>>>> b31bccdfbc8d8e898a85eef234d08a0a9444edbe
    private static final int portNumber = 1433;
    private static final String dbName = "AloTra";
    private static final String userID = "sa";
    private static final String password = "1234";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Đăng ký driver JDBC cho SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Xây dựng chuỗi kết nối
            String url;
            if (instance == null || instance.trim().isEmpty()) {
                // Default instance
                url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                        + ";databaseName=" + dbName
                        + ";encrypt=true;trustServerCertificate=true;";
            } else {
                // Named instance
                url = "jdbc:sqlserver://" + serverName + "\\" + instance + ":" + portNumber
                        + ";databaseName=" + dbName
                        + ";encrypt=true;trustServerCertificate=true;";
            }

            // Tạo kết nối
            conn = DriverManager.getConnection(url, userID, password);

        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy Driver JDBC của SQL Server.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Kết nối database thất bại. Vui lòng kiểm tra lại URL, username và password.");
            e.printStackTrace();
        }
        return conn;
    }

    // Test kết nối
    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối đến SQL Server thành công!");
            } else {
                System.out.println("Kết nối thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}