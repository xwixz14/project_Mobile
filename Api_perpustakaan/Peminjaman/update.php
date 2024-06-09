<?php
 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include "../Connection.php";

  $NimMahasiswa = $_POST ['text_NimMahasiswa'];
  $NamaMahasiswa = $_POST['text_NamaMahasiswa'];
  $NamaBuku = $_POST['text_NamaBuku'];
  $TanggalPeminjaman = $_POST['text_TanggalPeminjaman'];
  $TanggalPengembalian = $_POST['text_TanggalPengembalian'];

  $sql = "UPDATE peminjaman SET NamaMahasiswa='$NamaMahasiswa', NamaBuku = '$NamaBuku', TanggalPeminjaman = '$TanggalPeminjaman', TanggalPengembalian = '$TanggalPengembalian' 
  WHERE NimMahasiswa = '$NimMahasiswa'";
  
  $result = $connect->query($sql);
  echo json_encode(array(
    "success" => $result,
  ))

?>
