<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include "../Connection.php";

// Mendapatkan data dari POST request
$NamaBuku = $_POST['text_NamaBuku'];
$Penerbit = $_POST['text_Penerbit'];
$TahunPenerbit = $_POST['text_TahunPenerbit'];
$UploadGambar = $_FILES['UploadGambar'];

// Jika ada file yang diunggah
if(isset($UploadGambar['name'])) {
    // Pengelolaan gamba r
    $target_dir = "uploads/";

    // Membuat direktori uploads jika belum ada
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0755, true);
    }

    $target_file = $target_dir . basename($UploadGambar["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check ukuran file (5MB limit)
    if ($UploadGambar["size"] > 5000000) {
        $success = false;
        $reason = "Gambar terlalu besar";
    } else {
        // Memperbolehkan format file tertentu
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
            $success = false;
            $reason = "Hanya JPG, JPEG, PNG";
        } else {
            // Move file yang diunggah ke direktori yang ditentukan
            if (move_uploaded_file($UploadGambar["tmp_name"], $target_file)) {
                // Query untuk melakukan update data buku
                $sql = "UPDATE buku SET Penerbit='$Penerbit', TahunPenerbit='$TahunPenerbit', UploadGambar='$target_file' WHERE NamaBuku='$NamaBuku'";
                $result = $connect->query($sql);

                if (!$result) {
                    $success = false;
                    $reason = "Gagal mengubah data buku";
                }
            } else {
                $success = false;
                $reason = "Gagal mengunggah gambar";
            }
        }
    }
} else {
    // Jika tidak ada file yang diunggah, hanya update data lainnya
    $sql = "UPDATE buku SET Penerbit='$Penerbit', TahunPenerbit='$TahunPenerbit' WHERE NamaBuku='$NamaBuku'";
    $result = $connect->query($sql);
}

// Mengembalikan hasil dalam format JSON
echo json_encode(array(
    'success' => $result,
    'reason' => $reason ?? ''
));
?>
