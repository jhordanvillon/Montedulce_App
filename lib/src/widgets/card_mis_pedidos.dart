import 'package:flutter/material.dart';

class CardPedidoWidget extends StatefulWidget {
  const CardPedidoWidget({
    Key key,
    @required this.titulo,
    @required this.subtitulo,
    @required this.subtitulo2,
    @required this.ruta,
    @required this.selected,
  }) : super(key: key);

  final String titulo;
  final String subtitulo;
  final String subtitulo2;
  final String ruta;
  final Function selected;
  @override
  _CardPedidoWidgetState createState() => _CardPedidoWidgetState();
}

class _CardPedidoWidgetState extends State<CardPedidoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.selected,
      child: Container(
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: (widget.ruta != null) ? NetworkImage(widget.ruta) : AssetImage('assets/contenido-no-disponible.jpg'),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
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
                      Text((widget.titulo.length <= 18) ? widget.titulo : widget.titulo.substring(0,18) +"..." ,style: TextStyle(color: Color(0xff622420),fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((widget.subtitulo.length <= 21) ? widget.subtitulo : widget.subtitulo.substring(0,21) +"...",style: TextStyle(fontSize: 16,)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(widget.subtitulo2,style: TextStyle(fontSize: 16,)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}