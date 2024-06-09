import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/event/event_db.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _controllerUsername = TextEditingController();
  var _controllerPass = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Logo.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                child: Text(
                  "Pustakaku",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffA89DBF),
                  )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: 302,
                      height: 60,
                      child: TextFormField(
                        validator: (value) =>
                            value == '' ? 'jangan kosong' : null,
                        controller: _controllerUsername,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: 'Masukan email anda',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffA89DBF)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon:
                                Icon(Icons.people, color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 302,
                      height: 60,
                      child: TextFormField(
                        validator: (value) =>
                            value == '' ? 'jangan kosong' : null,
                        controller: _controllerPass,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            hintText: 'Masukan Password Anda',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffA89DBF)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon:
                                Icon(Icons.vpn_key, color: Colors.grey[400])),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 302,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            EventDb.loginScreen(
                                _controllerUsername.text, _controllerPass.text);
                            _controllerUsername.clear();
                            _controllerPass.clear();
                          }
                        },
                        child: Text(
                          "Login",
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
