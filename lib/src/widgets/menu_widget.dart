import 'package:flutter/material.dart';
class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
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
                          image:DecorationImage(image:AssetImage('assets/anderson.PNG')), 
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Anderson Surco',style:TextStyle(color:Color(0XFF480E0A),fontSize: 20,fontWeight: FontWeight.bold))
                    ],
                  ),
                  height:150,                  
                  decoration: BoxDecoration(
                    color:Color(0XFFFEFDE1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Container(
                padding:EdgeInsets.all(20),
                child:Container(
                  width: double.infinity,
                  height: 500,
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
}