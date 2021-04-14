import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // responsive
    return Scaffold(
        backgroundColor: Color(0xFFFEFDE1),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container( // logo
                height:size.height*0.23,
                width: size.width*0.4,
                child: Image(
                  image: AssetImage('assets/montedulce_logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Container( // formulario
                decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
                height: size.height * 0.7,
                width: size.width * 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height:size.height*0.04),
                    Text('Compra pasteles verdes', style: TextStyle(color:Color(0XFF480E0A),fontSize:20),),
                    Container(
                      height: size.height*0.20,
                      width: size.width*0.60,
                      child: Image(
                        image: AssetImage('assets/tasting.png'),
                        fit:BoxFit.fill
                      ),
                    ),                  
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:size.width*0.1),
                      child: TextField(
                        style: TextStyle(color:Color(0XFF480E0A),fontSize:20),
                        decoration: InputDecoration(hintText:'Email' ) ,
                      )
                    ),
                     SizedBox(
                      height:size.height*0.02),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:size.width*0.1),
                      child: TextField(
                        style: TextStyle(color:Color(0XFF480E0A),fontSize:20),
                        decoration: InputDecoration(hintText:'Contraseña'),
                        obscureText: true,
                      )
                    ),
                     SizedBox(
                      height:size.height*0.04),
                    Container(  // button
                      height: size.height*0.055,
                      width: size.width*0.55,
                      decoration: BoxDecoration(
                        color: Color(0xffFEFDE1),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text('Login', style: TextStyle(color:Color(0xFF480E0A), fontSize:20, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
