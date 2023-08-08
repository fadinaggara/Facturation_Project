import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/constants/config.dart';

import '../helpers/shared_prefs.dart';

class CaisseService {
  static Future<String?> getCaisse() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/caisse/"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> getCheque() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/caisse/cheque"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> getVirement() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/caisse/virement"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> getEspece() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/caisse/espaece"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
