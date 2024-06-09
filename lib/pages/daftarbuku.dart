import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/tambahbuku.dart';
import '../model/buku.dart';
import '../event/event_db_buku.dart';

class DaftarBuku extends StatefulWidget {
  const DaftarBuku({Key? key});

  @override
  State<DaftarBuku> createState() => _DaftarBukuState();
}

class _DaftarBukuState extends State<DaftarBuku> {
  List<Buku> _listBuku = [];

  void getbuku() async {
    _listBuku = await EventDb.getBuku();
    setState(() {});
  }

  void showOption(Buku? buku) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              // onTap: () => Get.back(result: 'edit'),
              // title: Text('Edit'),
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
      // case 'edit':
      //   Get.to(TambahBuku(
      //     buku: buku,
      //   ))?.then((value) => getbuku());
      //   break;

      case 'delete':
        EventDb.deleteBuku(buku!.NamaBuku!).then((value) => getbuku());
        break;
    }
  }

  @override
  void initState() {
    getbuku();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffA89DBF),
        title: Text(
          "Daftar Buku",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: _listBuku.length > 0
                ? ListView.builder(
                    itemCount: _listBuku.length,
                    itemBuilder: (context, index) {
                      Buku buku = _listBuku[index];
                      // Remove extra "uploads" if already present in the string
                      String imageUrl =
                          'http://192.168.43.28/Api_perpustakaan/Buku/${buku.UploadGambar!}';
                      print('Image URL: $imageUrl');

                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                image: buku.UploadGambar != null &&
                                        buku.UploadGambar!.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: buku.UploadGambar == null ||
                                      buku.UploadGambar!.isEmpty
                                  ? Icon(Icons.person, color: Colors.grey)
                                  : null,
                            ),
                            title: Text(
                              buku.NamaBuku ?? '',
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
                                  buku.Penerbit ?? '',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  buku.TahunPenerbit ?? '',
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  showOption(buku);
                                },
                                icon: Icon(Icons.more_vert)),
                          ),
                          Divider(
                            height: 30,
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: Text("Data Kosong"),
                  ),
          ),
          // Positioned(
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       Get.to(TambahBuku())?.then((value) => getbuku());
          //     },
          //     child: Icon(
          //       Icons.add,
          //       color: Colors.white,
          //     ),
          //     backgroundColor: Color(0xff093FFF),
          //   ),
          //   bottom: 100,
          //   right: 30,
          // )
        ],
      ),
    );
  }
}
