import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/helpers/shared_prefs.dart';

import '../constants/config.dart';

class AuthService {
  static Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$apiUrl/sign-up"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password
      }),
    );

    if (response.statusCode == 201) {
      // Success
      return jsonDecode(response.body);
    } else {
      // Failure
      throw Exception('Failed to sign up');
    }
  }

  static Future<Map<String, dynamic>?> signIn(
      String email, String password) async {
    final response = await http.post(
      Uri.parse("$apiUrl/sign-in"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // store token in SharedPreferences
      await SharedPreferencesHelper.setString('token', data['token']);
      return data;
    } else {
      return null;
    }
  }

  static Future<bool> signOut() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${SharedPreferencesHelper.getString('token')}', // replace with your token
    };
    final response = await http.post(
      Uri.parse("$apiUrl/sign-out"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final status = data['status'];
      return status;
    } else {
      throw Exception('Failed to sign out.');
    }
  }
}
