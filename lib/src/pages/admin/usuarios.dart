import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TituloWidget(titulo: 'Usuarios'),
              Container(
                height: size.height*0.8,
                child: ListView(
                  children: [
                    _cardProducto('Alfonso vader','assets/vader.jpg', 'Administrador'),
                    _cardProducto('Maria castillo','assets/usuaria.jpg', 'Cliente'),
                    _cardProducto('Peter castle','assets/castillo.jpg', 'Cliente'),
                    _cardProducto('Calamardo guapo','assets/calamardo.jpg', 'Cliente'),
                    _cardProducto('Maria castillo','assets/usuaria.jpg', 'Cliente'),
                    _cardProducto('Peter castle','assets/castillo.jpg', 'Cliente'),
                    _cardProducto('Alfonso sanchez','assets/calamardo.jpg', 'Cliente'),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardProducto(String nombre, String ruta, String rol){
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 3,right: 3,top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
            ],
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ruta),
                  fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nombre,style: TextStyle(color: Color(0xff622420),fontSize: 18),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rol: ',style: TextStyle(fontSize: 16,)),
                        Text(rol,style: TextStyle(fontSize: 14,color: Color(0xff622420)))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Dirección: ',style: TextStyle(fontSize: 16,)),
                    Text('Los Olivos',style: TextStyle(fontSize: 14,color: Color(0xff622420)))
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PopupMenuButton(
                  itemBuilder: (context) =>[
                    PopupMenuItem(child: Row(
                      children: [
                        Icon(Icons.edit_outlined),
                        Text('Editar')
                      ],
                    )),
                    PopupMenuItem(child: Row(
                      children: [
                        Icon(Icons.delete_outlined),
                        Text('Eliminar')
                      ],
                    ))
                  ],
                  child: Icon(Icons.more_vert)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}