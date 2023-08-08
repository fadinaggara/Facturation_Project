import 'dart:convert';

import 'package:last/helpers/shared_prefs.dart';

import '../constants/config.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<List<User>?> getAll() async {
    final token = await SharedPreferencesHelper.getString('token');
    //print("====>>$token");
    final response = await http.get(
      Uri.parse("$apiUrl/users/"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );
    if (response.statusCode == 200) {
      var listOfUsers = jsonDecode(response.body);
      List<User> listOfUsersConverted = [];
      listOfUsers.forEach((e) => {listOfUsersConverted.add(User.fromJson(e))});
      return listOfUsersConverted;
    } else {
      return null;
    }
  }

  static Future<bool> create(
      String email, String password, String name, int role) async {
    final token = await SharedPreferencesHelper.getString('token');
    final response =
        await http.post(Uri.parse("$apiUrl/users/create"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    }, body: {
      'email': email,
      'password': password,
      'name': name,
      'roles': [role]
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> delete(String id) async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.delete(
      Uri.parse("$apiUrl/users/$id"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> update(User user,String name,String email, int role) async {
    final token = await SharedPreferencesHelper.getString('token');
    final response =
        await http.put(Uri.parse("$apiUrl/users/update/${user.id}"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token!}'
    }, body: {
      "name": user.name,
      "email": user.email,
      "roles": [role]
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
