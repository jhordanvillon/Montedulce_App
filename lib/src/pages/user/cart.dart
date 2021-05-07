import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}


class _CartPageState extends State<CartPage> {
  final stiloLetra=TextStyle(color:Color(0XFF480E0A),fontSize: 20,fontWeight: FontWeight.bold);
   final stiloTitulto=TextStyle(color:Color(0XFF480E0A),fontSize: 30,fontWeight: FontWeight.bold);
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
      body: Container(
        child: Column(
          children: [
              SizedBox(            
                height: size.height*0.15,
                child: Center(
                  child:Text('Resumen de Pedido',style: stiloTitulto)
                ),            
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
    );
  }

    Widget _card(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
        child: Container(
                  padding: EdgeInsets.symmetric(horizontal:10,vertical:10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
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
        margin: EdgeInsets.only(top:30),
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:20,vertical:15),
          decoration: BoxDecoration(
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
                height: 35,
                decoration: BoxDecoration(color: Color(0xffFEFDE1)),
                child: Center(
                  child: Text('Comprar',style: stiloLetra),
                ),
              )
            ],
          ),
        ),
      );
    }

}

