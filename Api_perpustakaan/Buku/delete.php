<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
 include "../Connection.php";

 $NamaBuku = $_POST ['text_NamaBuku'];
 $sql = "DELETE FROM buku WHERE NamaBuku ='$NamaBuku'";
 $result = $connect -> query($sql);

echo json_encode(array(
    "success" => $result,
))
?>