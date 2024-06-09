class Api {
  static const _host = "http://192.168.43.28/Api_perpustakaan";

  static String _peminjaman = "$_host/peminjaman";

  static String getPeminjaman = "$_peminjaman/view.php";
  static String addPeminjaman = "$_peminjaman/add.php";
  static String updatePeminjaman = "$_peminjaman/update.php";
  static String deletePeminjaman = "$_peminjaman/delete.php";

  static String _buku = "$_host/buku";

  static String getBuku = "$_buku/view.php";
  static String addBuku = "$_buku/add.php";
  static String updateBuku = "$_buku/update.php";
  static String deleteBuku = "$_buku/delete.php";

  static String login = "$_host/login.php";
}
