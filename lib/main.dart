import 'package:flutter/material.dart';
import 'package:flutter_http_request/post_result_model.dart';
import 'package:flutter_http_request/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult = null;
  User? user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HTTP REQUEST"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(user != null
                  ? user!.id + " | " + user!.name
                  : "Tidak ada data"),
              ElevatedButton(
                  onPressed: () {
                    User.connectToAPI("5").then((value) {
                      user = value;
                      setState(() {});
                    });
                  },
                  child: Text("GET"))
            ],
          ),
        ),
      ),
    );
  }
}
