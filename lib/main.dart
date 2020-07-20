import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OJA",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApi(),
    );
  }
}
class MyApi extends StatefulWidget {
  @override
  _MyApiState createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {


Future<void> getdata() async{
  var res = await http.get("https://api.github.com/users/desi-programmer");
  var response = jsonDecode(res.body);
  print(response['repos_url']);
}

Future<void> postdata() async{
  var res = await http.post("https://api.github.com/users/desi-programmer",
  body: jsonEncode({"key": "value"}),
  headers: {'Content-type': 'application/json'}
  );
  var response = jsonDecode(res.body);
  print(response['repos_url']);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          child: MaterialButton(
            onPressed:getdata,
            color: Colors.indigoAccent,
            minWidth: 280.0,
            splashColor: Colors.red,
            padding: EdgeInsets.symmetric(
              vertical: 20.0,

            ),
            child:Text(
                "Get",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,

                )
            ),
          ),
        ),
      ]
    ),
      ),
    );
  }
}