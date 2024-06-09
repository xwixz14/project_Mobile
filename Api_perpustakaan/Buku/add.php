<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

include "../Connection.php";

$NamaBuku = $_POST['text_NamaBuku'];
$Penerbit = $_POST['text_Penerbit'];
$TahunPenerbit = $_POST['text_TahunPenerbit'];
$UploadGambar = $_FILES['UploadGambar'];

$sql1 = "SELECT * FROM buku WHERE NamaBuku ='$NamaBuku'";
$check = $connect->query($sql1);
$reason = "";
$success = true;

if ($check->num_rows > 0) {
    $success = false;
    $reason = "NamaBuku sudah ada";
} else {
    $target_dir = "uploads/";
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0755, true);
    }
    $target_file = $target_dir . basename($UploadGambar["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if ($UploadGambar["size"] > 5000000) {
        $success = false;
        $reason = "Gambar terlalu besar";
    } else {
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
            $success = false;
            $reason = "Hanya JPG, JPEG, PNG";
        } else {
            if ($success) {
                if (move_uploaded_file($UploadGambar["tmp_name"], $target_file)) {
                    $sql2 = "INSERT INTO buku (NamaBuku, Penerbit, TahunPenerbit, UploadGambar) VALUES ('$NamaBuku', '$Penerbit', '$TahunPenerbit', '$target_file')";
                    $result = $connect->query($sql2);

                    if (!$result) {
                        $success = false;
                        $reason = "Gagal menambahkan buku";
                    }
                } else {
                    $success = false;
                    $reason = "Gagal mengunggah gambar";
                }
            }
        }
    }
}

$response = array(
    "success" => $success,
    "reason" => $reason
);

echo json_encode($response);
exit(); // Menghentikan eksekusi skrip PHP setelah mengirim respons JSON
?>
