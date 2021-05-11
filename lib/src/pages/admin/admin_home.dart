import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Inicio',
                    style: TextStyle(color: Color(0xFF480E0A), fontSize: 36),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/productos.png',nombre: 'Productos'),
                    _cardOption(size: size,imgUrl: 'assets/categorias.png',nombre: 'Categorias')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/usuarios.png',nombre: 'Usuarios'),
                    _cardOption(size: size,imgUrl: 'assets/pedidos.png',nombre: 'Pedidos')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/estadisticas.png',nombre: 'Estadisticas'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardOption({Size size,String imgUrl,String nombre}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: size.width * 0.43,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 85,
            width: 85,
            child: Image(
              image: AssetImage(imgUrl),
            ),
          ),
          Text(nombre,style: TextStyle(color: Color(0xff622420),fontSize: 18),)
        ],
      ),
    );
  }
}
