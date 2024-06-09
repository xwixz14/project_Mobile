import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/tambahpeminjaman.dart';

import '../model/peminjaman.dart';
import '../event/event_db.dart';

class DaftarPeminjaman extends StatefulWidget {
  const DaftarPeminjaman({super.key});

  @override
  State<DaftarPeminjaman> createState() => _DaftarPeminjamanState();
}

class _DaftarPeminjamanState extends State<DaftarPeminjaman> {
  //
  List<Peminjaman> _listPeminjaman = [];
  void getpeminjaman() async {
    _listPeminjaman = await EventDb.getPeminjaman();
    setState(() {});
  }

  void showOption(Peminjaman? peminjaman) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'edit'),
              title: Text('Edit'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            ),
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'edit':
        Get.to(TambahPeminjaman(
          peminjaman: peminjaman,
        ))?.then((value) => getpeminjaman());
        break;

      case 'delete':
        EventDb.deletePeminjaman(peminjaman!.NimMahasiswa!)
            .then((value) => getpeminjaman());
        break;
    }
  }
  //

  @override
  //
  void initState() {
    getpeminjaman();
    super.initState();
  }

  //
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffA89DBF),
        title: Text("Daftar Peminjaman", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: _listPeminjaman.length > 0
                ? ListView.builder(
                    itemCount: _listPeminjaman.length,
                    itemBuilder: (context, index) {
                      Peminjaman peminjaman = _listPeminjaman[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.person)),
                              backgroundColor: Colors.white,
                            ),
                            title: Text(
                              peminjaman.NimMahasiswa ?? '',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  peminjaman.NamaMahasiswa ?? '',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Text(
                                  peminjaman.NamaBuku ?? '',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Text(
                                  peminjaman.TanggalPeminjaman ?? '',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Text(
                                  peminjaman.TanggalPengembalian ?? '',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  showOption(peminjaman);
                                },
                                icon: Icon(Icons.more_vert)),
                          ),
                          Divider(
                            height: 30,
                          ), // membuat garis pembatas antar listtitle
                        ],
                      );
                    },
                  )
                : Center(
                    child: Text("Data Kosong"),
                  ),
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: () {
                Get.to(TambahPeminjaman())?.then((value) => getpeminjaman());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0xffA89DBF),
            ),
            bottom: 100,
            right: 30,
          )
        ],
      ),
    );
  }
}
