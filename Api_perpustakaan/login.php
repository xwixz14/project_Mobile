<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
    include "connection.php";

    $username = $_POST['text_username'];
    $pass = md5($_POST['text_pass']);

    $sql = "
        SELECT 
            *
        FROM 
            user
        WHERE
            user.username = '$username' AND user.pass = '$pass'
    ";

    $result = $connect->query($sql);

    if($result->num_rows > 0){
        $user = array();

        while($row = $result->fetch_assoc()){
            $user[] = $row;
        }

        echo json_encode(array(
            "success"=> true,
            "user"=>$user[0],
        ));
    }else{
        echo json_encode(array(
            "success"=>false
        ));
    }

?>
