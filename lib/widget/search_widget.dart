import 'package:flutter/material.dart';
import 'package:wheather_app_bloc/widget/weather_app.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var getCountry = TextEditingController();
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Container(
        child: Form(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: getCountry,
                        decoration: InputDecoration(
                          labelText: "write city",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.pop(context,getCountry.text);
                          }),
                    ),
                  ],
                ))),
      ),
    );
  }
}
