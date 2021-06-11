import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'crearProducto');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Productos'),
                _busqueda(),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height * 0.75,
                  child: ListView(
                    children: [
                      _cardProducto(),
                      _cardProducto(),
                      _cardProducto(),
                      _cardProducto(),
                      _cardProducto(),
                      _cardProducto(),
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

  Widget _cardProducto(){
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
            child: Image(image: AssetImage('assets/torta1.png')),
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
                    Text('Torta Helada',style: TextStyle(color: Color(0xff622420),fontSize: 18),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precio: ',style: TextStyle(fontSize: 16,)),
                        Text('S/ 70.0',style: TextStyle(fontSize: 14,color: Color(0xff622420)))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Categoria: ',style: TextStyle(fontSize: 16,)),
                    Text('Tortas',style: TextStyle(fontSize: 14,color: Color(0xff622420)))
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