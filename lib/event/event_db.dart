import 'dart:convert';
import 'package:get/get.dart';
import 'package:perpustakaan/config/info.dart';
import 'package:perpustakaan/config/info.dart';
import 'package:perpustakaan/event/event_pref.dart';
import 'package:perpustakaan/model/user.dart';
import 'package:perpustakaan/pages/home.dart';
import '../config/api.dart';
import '../model/peminjaman.dart';
import 'package:http/http.dart' as http;

class EventDb {
  //view data peminjaman
  static Future<List<Peminjaman>> getPeminjaman() async {
    List<Peminjaman> listPeminjaman = [];
    try {
      var response = await http.get(Uri.parse(Api.getPeminjaman));

      //mencetak (respon dari statuscode)
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var peminjaman = responBody['peminjaman'];

          peminjaman.forEach((peminjaman) {
            listPeminjaman.add(Peminjaman.fromJson(peminjaman));
          });
        }
      }
    } catch (e) {
      print(e);
    }
    return listPeminjaman;
  }

// add daftar peminjaman
  static Future<String> AddPeminjaman(
      String NimMahasiswa,
      String NamaMahasiswa,
      String NamaBuku,
      String TanggalPeminjaman,
      String TanggalPengembalian) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addPeminjaman), body: {
        'text_NimMahasiswa': NimMahasiswa,
        'text_NamaMahasiswa': NamaMahasiswa,
        'text_NamaBuku': NamaBuku,
        'text_TanggalPeminjaman': TanggalPeminjaman,
        'text_TanggalPengembalian': TanggalPengembalian,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Data Peminjaman Berhasil ditambahkan';
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

  //update data peminjaman
  static Future<void> UpdatePeminjaman(
      String NimMahasiswa,
      String NamaMahasiswa,
      String NamaBuku,
      String TanggalPeminjaman,
      String TanggalPengembalian) async {
    try {
      var response = await http.post(Uri.parse(Api.updatePeminjaman), body: {
        'text_NimMahasiswa': NimMahasiswa,
        'text_NamaMahasiswa': NamaMahasiswa,
        'text_NamaBuku': NamaBuku,
        'text_TanggalPeminjaman': TanggalPeminjaman,
        'text_TanggalPengembalian': TanggalPengembalian,
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
  static Future<void> deletePeminjaman(String NimMahasiswa) async {
    try {
      var response = await http.post(Uri.parse(Api.deletePeminjaman),
          body: {'text_NimMahasiswa': NimMahasiswa});

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
  static Future<User?> loginScreen (String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'text_username': username,
        'text_pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              HomeScreen(),
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
