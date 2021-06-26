import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';

class CardProduct extends StatefulWidget {

  final Producto producto;
  final Function press;
  final Widget boton;
  
  CardProduct({
    Key key, 
    this.producto, 
    this.press,
    this.boton,
  }) : super(key: key);

  @override
  _CardProductState createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {


  final colorMarron = Color(0XFF480E0A);
  int _cantidad = 1;

  @override
  Widget build(BuildContext context) {
		return Container( 
      margin: EdgeInsets.all(8.0),
			padding: EdgeInsets.all(5.0),
      //width:  140.0,
			//height: 185.0,
			decoration: BoxDecoration(
				color: Colors.white,
				boxShadow: [
					BoxShadow(
						color: Colors.grey.withOpacity(0.4),
						spreadRadius: 3.0,
						blurRadius: 5.0
					)
				],
				borderRadius: BorderRadius.circular(10.0)
			),
			child: Column(
				children: <Widget>[
					Text( widget.producto.nombre ,style: TextStyle(color: colorMarron, fontWeight: FontWeight.bold,fontSize: 13.0),),
					Container(
						padding: EdgeInsets.symmetric(),
						child: GestureDetector(
              onTap: widget.press,
						  child: Image(
						  	alignment: Alignment.center,
						  	image: (widget.producto.imgLink != null) ? AssetImage(widget.producto.imgLink) : AssetImage('assets/contenido-no-disponible.jpg'),
						  	height: 100,
						  	width: 110,
						  	fit: BoxFit.fill
						  ),
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Container( height: 25.0, child: widget.boton,),
							cantidadProducto(),
							precio(), 
						],
					),
					SizedBox(height: 5.0,),
					botonComprar(),
				],
			),
		);
	}

  Widget cantidadProducto() {
		return Container(
      height: 25.0,
      width: 54.0,
      child: Row(
        children: [
        Container(
          height: 25.0,
          width: 18.0,
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove,size: 15.0,color: colorMarron,), 
              onPressed: ()  {
                setState(() => _cantidad > 1 ? _cantidad-- : _cantidad = 1);
              }
          ),
        ), 
        Container(
          height: 25.0,
          width: 18.0,
          child: Center(child: Text('$_cantidad',style: TextStyle(color: colorMarron))),
        ),
        Container(
          height: 25.0,
          width: 18.0,
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add,size: 15.0,color: colorMarron,), 
              onPressed: (){
                setState(() => _cantidad++);
              }
          ),
        ),  
        ],
      ),
    );
	}

  Widget precio() {
		return Container(
			child: Text('\$${widget.producto.precio}',style: TextStyle(color: colorMarron),),
		);
	}

  Widget botonComprar() {
		return Container(
			height: 25.0,
			child: CupertinoButton(
				color: Color(0xFFE8DB65),
				borderRadius: BorderRadius.circular(3.0),
				padding: EdgeInsets.only( right: 5.0,left: 5.0),
				child: Text('Comprar',style: TextStyle(color: colorMarron, fontSize: 12.0,fontWeight: FontWeight.bold),),
				onPressed: (){},
			),
		);
	}

  

}