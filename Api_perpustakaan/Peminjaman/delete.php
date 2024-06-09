<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
 include "../Connection.php";

 $NimMahasiswa = $_POST ['text_NimMahasiswa'];
 $sql = "DELETE FROM peminjaman WHERE NimMahasiswa ='$NimMahasiswa'";
 $result = $connect -> query($sql);

echo json_encode(array(
    "success" => $result,
))
?>