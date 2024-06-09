import 'dart:convert';
import 'dart:io';
import 'package:perpustakaan/config/info.dart';
import '../config/api.dart';
import '../model/buku.dart';
import 'package:http/http.dart' as http;

class EventDb {
  //view data 
  static Future<List<Buku>> getBuku() async {
    List<Buku> listBuku = [];
    try {
      var response = await http.get(Uri.parse(Api.getBuku));

      //mencetak (respon dari statuscode)
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var buku = responBody['buku'];

          buku.forEach((buku) {
            listBuku.add(Buku.fromJson(buku));
          });
        }
      }
    } catch (e) {
      print(e);
    }
    return listBuku;
  }

// add daftar buku
  static Future<String> AddBuku(
    String NamaBuku,
    String Penerbit,
    String TahunPenerbit,
    File? UploadGambar) async {
  String reason;

  try {
    String base64Image = '';
    if (UploadGambar != null) {
      List<int> imageBytes = UploadGambar.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
    }

    var response = await http.post(Uri.parse(Api.addBuku), body: {
      'text_NamaBuku': NamaBuku,
      'text_Penerbit': Penerbit,
      'text_TahunPenerbit': TahunPenerbit,
      'UploadGambar': base64Image, // Menggunakan string base64 gambar
    });
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Data buku Berhasil ditambahkan';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  //update data buku
  static Future<void> UpdateBuku(
    String NamaBuku,
    String Penerbit,
    String TahunPenerbit,
    File? UploadGambar) async {
  try {
    String base64Image = '';
    if (UploadGambar != null) {
      List<int> imageBytes = UploadGambar.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
    }

    var response = await http.post(Uri.parse(Api.updateBuku), body: {
      'text_NamaBuku': NamaBuku,
      'text_Penerbit': Penerbit,
      'text_TahunPenerbit': TahunPenerbit,
      'UploadGambar': base64Image, // Menggunakan string base64 gambar
    });
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Data Berhasil Di Edit');
        } else {
          Info.snackbar('Data Berhasil Di Edit');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //delete data peminjaman
  static Future<void> deleteBuku(String NamaBuku) async {
    try {
      var response = await http.post(Uri.parse(Api.deleteBuku),
          body: {'text_NamaBuku': NamaBuku});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Data berhasil dihapus');
        } else {
          Info.snackbar('Data Gagal dihapus');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
