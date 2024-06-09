<?php
 header ("Access-Control-Allow-Origin: *");
 header ("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
 header ("Access-Control-Allow-Headers: Content-Type, Authorization");

 include "../Connection.php";

 //Post ada disini
 
 $NimMahasiswa = $_POST['text_NimMahasiswa'];
 $NamaMahasiswa = $_POST['text_NamaMahasiswa'];
 $NamaBuku = $_POST['text_NamaBuku'];
 $TanggalPeminjaman = $_POST['text_TanggalPeminjaman'];
 $TanggalPengembalian = $_POST['text_TanggalPengembalian'];

 // isi query untuk cek data peminjaman by NimMahasiswa
 $sql1 = "SELECT *FROM peminjaman WHERE NimMahasiswa ='$NimMahasiswa'";

 $check = $connect -> query ($sql1);
 $reason = "";
 $success = true;

 if ($check -> num_rows > 0){
    $success = false;
    $reason = "NimMahasiswa sudah ada";
}else {
    //query insert data
    $sql2 = "INSERT INTO peminjaman SET NImMahasiswa = '$NimMahasiswa', NamaMahasiswa ='$NamaMahasiswa', NamaBuku = '$NamaBuku', TanggalPeminjaman = '$TanggalPeminjaman', TanggalPengembalian = '$TanggalPengembalian'";
    
    $result = $connect -> query($sql2);

    if (!$result){
        $success = false;
        $reason = "gagal menambahkan peminjaman buku";
    }
}

echo json_encode(array(
    "success" => $success,
))
 
?>