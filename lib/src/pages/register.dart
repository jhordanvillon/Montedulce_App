import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  //logo
                  height: size.height * 0.23,
                  width: size.width * 0.4,
                  child: Image(
                    image: AssetImage('assets/montedulce_logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  height: size.height * 0.7,
                  width: size.width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'Registrarse',
                          style: TextStyle(color: Color(0XFF480E0A), fontSize: 33),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: TextField(
                              style:
                                  TextStyle(color: Color(0XFF480E0A), fontSize: 20),
                              decoration: InputDecoration(hintText: 'Nombre'),
                            )),
                        SizedBox(height: size.height * 0.02),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: TextField(
                              style:
                                  TextStyle(color: Color(0XFF480E0A), fontSize: 20),
                              decoration: InputDecoration(hintText: 'Email'),
                            )),
                        SizedBox(height: size.height * 0.02),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: TextField(
                              style:
                                  TextStyle(color: Color(0XFF480E0A), fontSize: 20),
                              decoration: InputDecoration(hintText: 'Contraseña'),
                              obscureText: true,
                            )),
                        SizedBox(height: size.height * 0.02),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: size.width * 0.1),
                            child: TextField(
                              style:
                                  TextStyle(color: Color(0XFF480E0A), fontSize: 20),
                              decoration:
                                  InputDecoration(hintText: 'Repetir contraseña'),
                              obscureText: true,
                            )),
                        SizedBox(height: size.height * 0.04),
                        Container(
                          //button
                          child: Center(
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 55.0, vertical: 3.0),
                                child: Text('Registrarse',
                                    style: TextStyle(
                                        color: Color(0xFF480E0A),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              color: Color(0xffFEFDE1),
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text('Tienes cuenta?',
                              style:
                                  TextStyle(color: Color(0xFF480E0A), fontSize: 18)
                          ),
                          CupertinoButton(
                              child: Text('Login',style: TextStyle(color: Color(0XFFE1232D), fontSize: 18)),
                              onPressed: () {Navigator.pushNamed(context,'login');} 
                          )
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
