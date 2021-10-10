import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.createUser(Map<String, dynamic> object){
    return User(
      id : object['id'].toString(),
      name : object['first_name'] + object['last_name'],
      email : object['email'],
    );
  }

  static Future<User> connectToAPI(String id) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users/"+ id);

    var apiResult = await http.get(apiUrl);
    var objectResult = json.decode(apiResult.body);

    var userData = (objectResult as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}