import 'package:flutter/material.dart';
class MenuWidget extends StatefulWidget {

  


  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {

  final colorMarron = new Color(0XFF480E0A);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    

    return Container(
      child: Drawer(
        child: Container(
          child:Column(
            children:[
              Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                  width: double.infinity,  //ocupar todo el espacio dispo
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          image:DecorationImage(image:AssetImage('assets/contenido-no-disponible.jpg'),fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text( "User",style:TextStyle(color:Color(0XFF480E0A),fontSize: 20,fontWeight: FontWeight.bold))
                    ],
                  ),
                  height: size.height * 0.25,                  
                  decoration: BoxDecoration(
                    color:Color(0XFFFEFDE1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Container(
                padding:EdgeInsets.all(20),
                child:Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20.0,),
                          Text('Menu', style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Color(0XFF480E0A),),),
                        ],
                      ),
                      Divider(color: colorMarron,),
                      SizedBox(height: 15.0,),
                      _opciones(titulo: 'Inicio', icon: Icons.home, press: () => Navigator.pushNamed(context, 'home')),
                      _opciones(titulo: 'Perfil', icon: Icons.person,press: () => Navigator.pushNamed(context, 'perfil')),
                      _opciones(titulo: 'Mis pedidos', icon: Icons.shopping_cart, press: () => Navigator.pushNamed(context, 'misPedidos')),
                      _opciones(titulo: 'Salir', icon: Icons.logout,press: () => Navigator.pushNamed(context, 'login')),
                    ],
                  ),
                  width: double.infinity,
                  height: size.height * 0.55,
                  decoration: BoxDecoration(
                    color: Color(0XFFFEFDE1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                )
              )
            ]
          )
        )
      )
    );
  }

  Widget _opciones({String titulo, IconData icon, Function press}){
    return ListTile(
      title: Text(titulo,style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: colorMarron),),
      leading: Icon(icon,color: colorMarron,size: 30.0,),
      onTap: press,
    );
  }

}