import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
class CategoriasPage extends StatefulWidget {
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
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
              TituloWidget(titulo: 'Categorias'),
              Container(
                height: size.height*0.8,
                child: ListView(
                  children: [
                    _cardProducto('Chiffon','assets/chifon.png', 'C0001','...'),
                    _cardProducto('Zanahoria','assets/zanahoria.png', 'C0002','...'),
                    _cardProducto('Devil food','assets/devil.png', 'C0003','...'),
                    _cardProducto('Natilla','assets/natilla.png', 'C0004','...'),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardProducto(String nombre, String ruta, String rol, String descripcion){
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
                        Text('Codigo: ',style: TextStyle(fontSize: 16,)),
                        Text(rol,style: TextStyle(fontSize: 14,color: Color(0xff622420)))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Descirpción: ',style: TextStyle(fontSize: 16,)),
                    Text(descripcion,style: TextStyle(fontSize: 14,color: Color(0xff622420)))
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