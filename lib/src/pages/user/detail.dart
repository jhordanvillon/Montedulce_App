import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/Product.dart';

class DetailProduct extends StatefulWidget {
  final Product product;

  DetailProduct({Key key, this.product}) : super(key: key);
  
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {

  final colorMarron = Color(0XFF480E0A);
  int _cantidad = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back,color: colorMarron,),
        )
      ),
      body: Theme(
        data: ThemeData(accentColor: Colors.grey),
        child: Column(
          children: <Widget>[
            imagenProducto(size),
            precioProducto(),
            SizedBox(height: 10.0,),
            Expanded(
              child: Container(
                width: double.infinity,
                //height: size.height * 0.52,
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: descripcion(size),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagenProducto(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.50,
        height: size.height * 0.25,
        child: Image(
          image: AssetImage(widget.product.image),
        ),
      ),
    );
  }

  Widget precioProducto() {
    return Container(
      padding: EdgeInsets.only(left: 18.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Precio',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0, color: colorMarron),),
          SizedBox(height: 5.0,),
          Text('\$ ${widget.product.price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: colorMarron),),
        ],
      )
    );
  }

  Widget descripcion(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text( widget.product.title ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: colorMarron),),
        SizedBox(height: 5.0,),
        Text('Peso 1kg',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0, color: colorMarron),),
        SizedBox(height: 5.0,),
        Text( widget.product.description ,
            style: TextStyle(fontSize: 15.0,color: colorMarron),
            textAlign: TextAlign.start,
        ),
        SizedBox(height: 15.0,),
        cantidad(size),
        SizedBox(height: 15.0,),
        comprarAhora()
      ],
    );
  }

  Widget cantidad(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButton(Icons.remove, (){ setState(() =>_cantidad > 1 ? _cantidad-- : _cantidad = 1); }), 
        SizedBox(width: 8.0,),
        Container(width: 30.0,height: 30.0 , child: Text( '$_cantidad' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: colorMarron),textAlign: TextAlign.center,)),
        SizedBox(width: 8.0,),
        iconButton(Icons.add, (){ setState(() =>_cantidad++); }), 
      ],
    );
  }

  Widget comprarAhora() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconButton(Icons.shopping_cart_outlined, (){}),
        CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          color: Color(0xFFE8DB65),
          child: Text('Comprar Ahora', style: TextStyle(color: colorMarron,fontWeight: FontWeight.bold),), 
          onPressed: (){}
        )
      ],
    );
  }

  Widget iconButton( IconData icon, Function press ){
    return  OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          primary: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          side: BorderSide(
            color: colorMarron,
            width: 1.5,
          ),
        ),
        child: Container(child: Icon(icon, color: colorMarron,),),
    );
    
  }

  
}