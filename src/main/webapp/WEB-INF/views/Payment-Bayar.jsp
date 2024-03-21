<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Halaman Pembayaran</title>
    <style>
        body,html{
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
            padding: 0;
        }

        h1 {
            color: #333;
        }

        form {
            display: inline-block;
            text-align: left;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            margin-bottom: 10px;
            display: inline-block; /* Mengubah tampilan label agar berjejer horizontal */
            margin-right: 15px; /* Menambah margin antar label agar tidak terlalu dekat */
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
    <!-- Tambahkan link ke CSS atau styling lainnya jika diperlukan -->
</head>
<body>
    
    <h1>Halaman Pembayaran</h1>

    <!-- Tampilkan formulir pembayaran -->
    <form action="./payment" method="post">
        <center>
        <label for="paymentMethod">Metode Pembayaran:</label>
        <br>
        <!-- Gunakan input tipe "radio" untuk setiap opsi metode pembayaran -->
        <input type="radio" name="paymentMethod" id="creditCard" value="creditCard" checked>
        <label for="creditCard">Kartu Kredit</label>
        <input type="radio" name="paymentMethod" id="bankTransfer" value="bankTransfer">
        <label for="bankTransfer">Transfer Bank</label>
        <!-- Tambahkan opsi lainnya sesuai kebutuhan -->
        
        <br>

        <label for="duration">Durasi:</label>
        <br>
        <!-- Gunakan input tipe "radio" untuk setiap opsi durasi -->
        <input type="radio" name="duration" id="1" value="1" checked>
        <label for="1">1 Bulan</label>
        <input type="radio" name="duration" id="3" value="3">
        <label for="3">3 Bulan</label>
        <input type="radio" name="duration" id="6" value="6">
        <label for="6">6 Bulan</label>
        <input type="radio" name="duration" id="12" value="12">
        <label for="12">12 Bulan</label>
        <!-- Tambahkan opsi lainnya sesuai kebutuhan -->

        <br>
        <button type="submit">Bayar</button>
        </center>
    </form>

    <!-- Tambahkan tautan atau elemen lainnya sesuai kebutuhan -->

</body>
</html>
