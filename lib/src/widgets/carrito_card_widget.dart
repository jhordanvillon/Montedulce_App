import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';

class CarritoItemCard extends StatefulWidget {

  final Producto producto;
  Function remover;
  Function anadir;

  CarritoItemCard({Key key,this.producto,this.remover,this.anadir}) :  super(key: key);
  
  @override
  _CarritoItemCardState createState() => _CarritoItemCardState();
}

class _CarritoItemCardState extends State<CarritoItemCard> {


  int _cantidad = 1;

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal:10,vertical: 12),
        
        child: Container(
                  padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Colors.white,          
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3.0,
                        blurRadius: 5.0
                      )
                    ],
                  ),
                  child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                 width: 80,
                 decoration: BoxDecoration(
                image: DecorationImage(
                    image: (widget.producto.imgLink != null) ? NetworkImage(widget.producto.imgLink) : AssetImage('assets/contenido-no-disponible.jpg'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.producto.nombre,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21, color: Color(0xff480E0A)),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("S/."+widget.producto.precio.toString(),style: TextStyle(color:Color(0XFF480E0A),fontSize: 20.0,fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          IconButton(icon: Icon(Icons.add_circle_outline, color: Color(0xff480E0A)),onPressed: widget.anadir,
                          iconSize: 30),
                          Text('${widget.producto.cantidad}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0XFF480E0A))),
                          IconButton(icon: Icon(Icons.remove_circle_outline,color: Color(0xff480E0A)),onPressed: widget.remover,
                          iconSize: 30)
                        ]
                      ),
                    )
                  ],
                ),              
              ],
            ),
            Container(
              child: Column(
                children: [
                  //IconButton(icon: Icon(Icons.delete_outline,color: Color(0XFF480E0A),), onPressed: (){}),
                  //Text('S/156.2',style: TextStyle(color:Color(0XFF480E0A),fontSize: 15,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}