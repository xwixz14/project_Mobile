<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization");


include '../Connection.php';

$sql = "SELECT * FROM buku";

$result = $connect -> query($sql);

if ($result -> num_rows > 0){
    $buku = array();
    while ($row = $result -> fetch_assoc()){
        $buku [] = $row;
    }

    echo json_encode(array(
        "success" => true,
        "buku" => $buku,

    ));

}else{
    echo json_encode(array(
        "sucess" => false,
    ));
}
?>