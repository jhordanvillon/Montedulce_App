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

        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TituloWidget(titulo: 'Productos'),
              Container(
                height: size.height*0.8,
                child: ListView(
                  children: [
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
                    _cardProducto(),
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
    );
  }

  Widget _cardProducto(){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
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