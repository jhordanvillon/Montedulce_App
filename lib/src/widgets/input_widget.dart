import 'package:flutter/material.dart';

class Input extends StatefulWidget {

  String hinText;
  IconData icon;

  Input({
    Key key,
    this.hinText,
    @required this.icon
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hinText,
        prefixIcon: Icon(widget.icon)
      ),
      
    );
  }
}