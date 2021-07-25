import 'package:flutter/material.dart';
class TituloWidget extends StatelessWidget {
  final String titulo;

  const TituloWidget({Key key, this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      child: Row(
        children: [
          Text(titulo,style: TextStyle(color: Color(0xFF480E0A), fontSize: 36),),
        ],
      )
    );
  }
}