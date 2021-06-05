import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {
  final stiloLetra=TextStyle(color:Color(0XFF480E0A),fontSize: 20,fontWeight: FontWeight.bold);
   final stiloTitulto=TextStyle(color:Color(0XFF480E0A),fontSize: 30,);
   int numero=1;

    void sumar(){
      setState(() {
              numero++;
      });
    }

    void restar(){
      if(numero>=1){
          setState(() {
            numero--;
          });
      }
    }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFEFDE1),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text('Resumen de Pedido',style: stiloTitulto)
                ),
                Container(
                  height: size.height*0.85,
                  decoration: BoxDecoration(
                    color:Color(0xfff3f3f3),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),   
                  ),
                  child: Column(
                    children: [
                    Container(
                      height: size.height*0.5,
                      child: ListView(
                        padding: EdgeInsets.only(top:15),
                        children: [
                          _card(),
                          _card(),
                          _card(),
                          _card(),
                        ],
                      ),
                    ),     
                        _infoPago()            
                    ],
                  ),

                ),
            ],
          )
        ),
      ),
    );
  }

    Widget _card(){
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/torta1.png')),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Torta Helada',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              SizedBox(height: 10),
                  Text('Peso 1 kg',style: TextStyle(color:Color(0XFF480E0A),fontSize: 15,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.add_circle_outline, color: Color(0xff480E0A)), onPressed: (){sumar();},iconSize: 30),
                      Text('$numero',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0XFF480E0A))),
                      IconButton(icon: Icon(Icons.remove_circle_outline,color: Color(0xff480E0A)), onPressed: (){restar();},iconSize: 30)
                    ]
                  )
                ],
                
              ),
              Container(
                child: Column(
                  children: [
                    IconButton(icon: Icon(Icons.delete_outline,color: Color(0XFF480E0A),), onPressed: (){}),
                     Text('S/156.2',style: TextStyle(color:Color(0XFF480E0A),fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    Widget _infoPago(){
      return Container(
        margin: EdgeInsets.only(top:25),
        padding: EdgeInsets.symmetric(horizontal:13),
        
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:20,vertical:15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('Sub total',style: stiloLetra),
                  Text('S/400',style: stiloLetra),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('Descuento',style: stiloLetra),
                  Text('S/100',style: stiloLetra),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text('Total',style: stiloLetra),
                  Text('S/300',style: stiloLetra),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: CupertinoButton(
                  padding: EdgeInsets.only(top: 0.0, bottom: 0.0, right: 80,left: 80),
                  color: Color(0xFFE8DB65),
                  child: Text('Comprar Ahora', style: TextStyle(color: Color(0XFF480E0A),fontWeight: FontWeight.bold),), 
                  onPressed: () => Navigator.pushNamed(context, 'checkout')
                  )
              )
            ],
          ),
        ),
      );
    }

}

