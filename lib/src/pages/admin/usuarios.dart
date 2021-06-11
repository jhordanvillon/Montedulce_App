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
          Navigator.pushNamed(context, 'crearUsuario');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Usuarios'),
                _busqueda(),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height*0.75,
                  child: ListView(
                    children: [
                      _cardUsuario('Alfonso vader','assets/vader.jpg', 'Administrador'),
                      _cardUsuario('Maria castillo','assets/usuaria.jpg', 'Cliente'),
                      _cardUsuario('Peter castle','assets/castillo.jpg', 'Cliente'),
                      _cardUsuario('Calamardo guapo','assets/calamardo.jpg', 'Cliente'),
                      _cardUsuario('Maria castillo','assets/usuaria.jpg', 'Cliente'),
                      _cardUsuario('Peter castle','assets/castillo.jpg', 'Cliente'),
                      _cardUsuario('Alfonso sanchez','assets/calamardo.jpg', 'Cliente'),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _busqueda(){
			return Container(
				child: TextField(
					textAlign: TextAlign.center,
					textCapitalization: TextCapitalization.sentences,
					cursorColor: Color(0XFF480E0A),
					decoration: InputDecoration(
						contentPadding: EdgeInsets.all(10.0),
						fillColor: Colors.white,
						filled: true,
						border: OutlineInputBorder(
							borderRadius: BorderRadius.circular(10.0),
							borderSide: BorderSide.none,
						),
						hintText: 'Buscar',
						hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
					)
				),
			);
	}

  Widget _cardUsuario(String nombre, String ruta, String rol){
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