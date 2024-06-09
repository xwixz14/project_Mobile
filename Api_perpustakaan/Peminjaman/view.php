<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");




    include "../Connection.php";

    $sql = "SELECT * FROM peminjaman";

    $result = $connect -> query($sql);

    if($result -> num_rows > 0){
        $peminjaman = array ();
        while ($row = $result -> fetch_assoc()){
            $peminjaman [] = $row;
        }
    
        echo json_encode(array(
            "success" => true,
            "peminjaman" => $peminjaman,
        ));
    }else{
        echo json_encode(array(
            "success" => false,
        ));
    }
?>