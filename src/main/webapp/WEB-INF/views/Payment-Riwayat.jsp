<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Riwayat Pembayaran</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }

        h1 {
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
    <!-- Tambahkan link ke CSS atau styling lainnya jika diperlukan -->
</head>
<body>
    <h1>Riwayat Pembayaran</h1>

    <table>
        <thead>
            <tr>
                <th>ID Pembayaran</th>
                <th>Metode Pembayaran</th>
                <th>Status Pembayaran</th>
                <th>Tanggal Pembayaran</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="payment" items="${riwayatpembayaran}">
                <tr>
                    <td>${payment.paymentId}</td>
                    <td>${payment.paymentMethod}</td>
                    <td>${payment.paymentStatus}</td>
                    <td>${payment.paymentDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Tambahkan tautan atau elemen lainnya sesuai kebutuhan -->

</body>
</html>
