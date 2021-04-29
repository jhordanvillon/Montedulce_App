import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/widgets/menu_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xff010130)),
        ),
      drawer: MenuWidget()
    );
  }
}