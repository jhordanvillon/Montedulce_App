import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TituloWidget(titulo: 'Inicio',),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/productos.png',nombre: 'Productos',context: context,ruta: ''),
                    _cardOption(size: size,imgUrl: 'assets/categorias.png',nombre: 'Categorias',context: context,ruta: '')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/usuarios.png',nombre: 'Usuarios',context: context,ruta: ''),
                    _cardOption(size: size,imgUrl: 'assets/pedidos.png',nombre: 'Pedidos',context: context,ruta: '')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _cardOption(size: size,imgUrl: 'assets/estadisticas.png',nombre: 'Estadisticas',context: context,ruta: 'estadisticas'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardOption({Size size,String imgUrl,String nombre,BuildContext context,String ruta}) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ruta);
      },
      child: Container(
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
      ),
    );
  }
}
