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

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: object['first_name'] + object['last_name'],
      email: object['email'],
    );
  }

  // static Future<User> connectToAPI(String id) async {
  //   var apiUrl = Uri.parse("https://reqres.in/api/users/"+ id);

  //   var apiResult = await http.get(apiUrl);
  //   var objectResult = json.decode(apiResult.body);

  //   var userData = (objectResult as Map<String, dynamic>)['data'];

  //   return User.createUser(userData);
  // }

  static Future<List<User>> getUsers(String page) async {
    var apiurl = Uri.parse("https://reqres.in/api/users?page=" + page);

    var apiResult = await http.get(apiurl);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listUsers = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUsers.length; i++) {
      users.add(User.createUser(listUsers[i]));
    }

    return users;
  }
}
