import 'package:flutter/cupertino.dart';

class MaxMinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Maximum : ", style: TextStyle(fontSize: 22)),
        Text("Minimum : ", style: TextStyle(fontSize: 22)),
      ],
    );
  }
}
