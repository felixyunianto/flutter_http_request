import 'package:flutter/material.dart';
import 'package:flutter_http_request/post_result_model.dart';

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
              Text(postResult != null
                  ? postResult!.id + " | " + postResult!.name
                  : "Tidak ada data"),
              ElevatedButton(
                  onPressed: () {
                    PostResult.connectToAPI("Felix", "Frontend Developer")
                        .then((value) {
                      postResult = value;
                      setState(() {});
                    });
                  },
                  child: Text("POST"))
            ],
          ),
        ),
      ),
    );
  }
}
