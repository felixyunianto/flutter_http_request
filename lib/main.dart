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

  String output = "Tidak ada data";

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
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    // User.connectToAPI("5").then((value) {
                    //   user = value;
                    //   setState(() {});
                    // });

                    User.getUsers("2").then((users) {
                      output = "";

                      for (int i = 0; i < users.length; i++)
                        output = output + "[ " + users[i].name + " ]";
                      setState(() {});
                    });
                  },
                  child: Text("GET LIST"))
            ],
          ),
        ),
      ),
    );
  }
}
