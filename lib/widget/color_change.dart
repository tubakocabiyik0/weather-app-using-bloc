import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorChange extends StatelessWidget {

  Color backcolor;
  Widget child;


  ColorChange(this.backcolor, this.child);
  @override
  Widget build(BuildContext context) {
    return Container(child: child,decoration: BoxDecoration(gradient:LinearGradient(colors: [backcolor,backcolor.withGreen(5)],begin: Alignment.topCenter,end: Alignment.bottomCenter)));
  }




}