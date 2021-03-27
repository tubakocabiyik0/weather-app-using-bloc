import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  String cityname;

  LocationWidget(this.cityname);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(widget.cityname==null ? "İstanbul" :widget.cityname ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    );
  }
}