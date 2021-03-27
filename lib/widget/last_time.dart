import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastTimeWidget extends StatefulWidget {
  @override
  _LastTimeWidgetState createState() => _LastTimeWidgetState();
}

class _LastTimeWidgetState extends State<LastTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        "Time",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      ),
    );
  }
}
