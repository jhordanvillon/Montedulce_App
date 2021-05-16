import 'package:flutter/material.dart';

class Input extends StatefulWidget {

  String hinText, initialValue;
  IconData icon;
  bool fill,enabled;
  Color fillColor;
  Input({
    Key key,
    this.hinText,
    this.fill,
    this.fillColor,
    this.initialValue,
    this.enabled,
    @required this.icon

  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      controller: TextEditingController(text: widget.initialValue),
      decoration: InputDecoration(
        filled: widget.fill,
        fillColor: widget.fillColor,
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