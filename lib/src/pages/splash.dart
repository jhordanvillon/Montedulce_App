import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:montedulce_integrador/src/service/auth.dart';

class SplashHomePage extends StatefulWidget {
  @override
  _SplashHomePageState createState() => _SplashHomePageState();
}

class _SplashHomePageState extends State<SplashHomePage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final String token = await Auth.instance.accessToken;
    print(token);
    if (token != null) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff010130),
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}