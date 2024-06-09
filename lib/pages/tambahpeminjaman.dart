import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../event/event_db.dart';
import '../model/peminjaman.dart';
import '../config/info.dart';
import '../pages/daftarpeminjaman.dart';

class TambahPeminjaman extends StatefulWidget {
  //
  final Peminjaman? peminjaman;
  TambahPeminjaman({this.peminjaman});
  //
  @override
  State<TambahPeminjaman> createState() => _TambahPeminjamanState();
}

class _TambahPeminjamanState extends State<TambahPeminjaman> {
  //
  var _formKey = GlobalKey<FormState>();
  var _controllerNimmahasiswa = TextEditingController();
  var _controllerNamamahasiswa = TextEditingController();
  var _controllerNamabuku = TextEditingController();
  var _controllerTanggalpeminjaman = TextEditingController();
  var _controllerTanggalpengembalian = TextEditingController();

  bool _isHidden = true;
  //
  @override

  //
  void initState() {
    //implementasikan init state
    if (widget.peminjaman != null) {
      _controllerNimmahasiswa.text = widget.peminjaman!.NimMahasiswa!;
      _controllerNamamahasiswa.text = widget.peminjaman!.NamaMahasiswa!;
      _controllerNamabuku.text = widget.peminjaman!.NamaBuku!;
      _controllerTanggalpeminjaman.text = widget.peminjaman!.TanggalPeminjaman!;
      _controllerTanggalpengembalian.text =
          widget.peminjaman!.TanggalPengembalian!;
    }
    super.initState();
  }

  //
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 0,
        title: widget.peminjaman != null
            ? Text(
                'Edit Peminjaman',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )
            : Text(
                "Tambah Peminjaman",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
        centerTitle: true,
        backgroundColor: Color(0xffA89DBF),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/poto1.jpeg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        widget.peminjaman != null ? "Edit" : "Tambah",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Peminjaman",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Container(
                width: 350,
                height: 60,
                child: TextFormField(
                  enabled: widget.peminjaman == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan kosong' : null,
                  controller: _controllerNimmahasiswa,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      hintText: "Masukan Nim Mahasiswa",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffA89DBF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              child: TextFormField(
                validator: (value) => value == '' ? 'Jangan kosong' : null,
                controller: _controllerNamamahasiswa,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    hintText: "Masukan Nama Mahasiswa",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA89DBF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              child: TextFormField(
                validator: (value) => value == '' ? 'Jangan kosong' : null,
                controller: _controllerNamabuku,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    hintText: "Masukan Nama Buku",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA89DBF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              child: TextFormField(
                validator: (value) => value == '' ? 'Jangan kosong' : null,
                controller: _controllerTanggalpeminjaman,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    hintText: "Masukan Tanggal Peminjaman",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA89DBF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              child: TextFormField(
                validator: (value) => value == '' ? 'Jangan kosong' : null,
                controller: _controllerTanggalpengembalian,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    hintText: "Masukan Tanggal Pengembalian",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffA89DBF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.peminjaman == null) {
                      String message = await EventDb.AddPeminjaman(
                          _controllerNimmahasiswa.text,
                          _controllerNamamahasiswa.text,
                          _controllerNamabuku.text,
                          _controllerTanggalpeminjaman.text,
                          _controllerTanggalpengembalian.text);
                      Info.snackbar(message);
                      if (message.contains('berhasil')) {
                        _controllerNimmahasiswa.clear();
                        _controllerNamamahasiswa.clear();
                        _controllerNamabuku.clear();
                        _controllerTanggalpeminjaman.clear();
                        _controllerTanggalpengembalian.clear();
                        Get.off(
                          DaftarPeminjaman(),
                        );
                      }
                    } else {
                      EventDb.UpdatePeminjaman(
                          _controllerNimmahasiswa.text,
                          _controllerNamamahasiswa.text,
                          _controllerNamabuku.text,
                          _controllerTanggalpeminjaman.text,
                          _controllerTanggalpengembalian.text);
                      Get.off(
                        DaftarPeminjaman(),
                      );
                    }
                  }
                },
                child: Text(
                  widget.peminjaman == null ? 'simpan' : 'Ubah',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffA89DBF)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DaftarPeminjaman();
                  }));
                },
                child: Text(
                  "Batal",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffA89DBF)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
