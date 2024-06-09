import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perpustakaan/forms/login.dart';
import 'package:perpustakaan/pages/daftarbuku.dart';
import 'package:perpustakaan/pages/daftarpeminjaman.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/pages/about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // membuat tittle di appbar //
      appBar: AppBar(
        backgroundColor: Color(0xffA89DBF),
        title: Text(
          "Pustakaku",
          style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
      // membuat tittle di appbar //

      body: SingleChildScrollView(
        child: Column(
          children: [
            // membuat tittle di admin //
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xffC9C1D6),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15))),
                ),
                Container(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              child: Text(
                            "Selamat Datang Admin",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                            iconSize: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // membuat tittle di admin //
            SizedBox(
              height: 100,
            ),
        
            // membuat background //
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 525,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Bg.jpeg"), fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                ),
                // membuat background //
        
                // membuat fitur lihat buku //
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 170,
                        width: 343,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DaftarBuku();
                            }));
                          },
                          style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.all(0)), // Menghapus padding default
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/buku.jpeg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  child: Text(
                                    "Lihat Buku",
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // membuat fitur lihat buku //
        
                      // membuat fitur daftar peminjam //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 170,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return DaftarPeminjaman();
                                }));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(EdgeInsets.all(
                                    0)), // Menghapus padding default
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/daftar.jpeg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Daftar ",
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                        Text(
                                          " Peminjam",
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // membuat fitur daftar peminjam //
        
                          SizedBox(
                            width: 20,
                          ),
        
                          // membuat fitur About us //
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 170,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return About();
                                }));
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(EdgeInsets.all(
                                    0)), // Menghapus padding default
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/about.jpeg",
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Container(
                                      child: Text(
                                        "About us",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // membuat fitur About us //
                      SizedBox(
                        height: 20,
                      ),
        
                      // membuat Button Log out //
                      Container(
                        height: 50,
                        width: 344,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffA89DBF))),
                        ),
                      )
                      // membuat Button Log out //
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
