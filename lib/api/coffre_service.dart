import 'package:http/http.dart' as http;
import 'package:last/constants/config.dart';

import '../helpers/shared_prefs.dart';

class CofferService {
  static Future<String?> getCaisse() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/coffer/"),
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
      Uri.parse("$apiUrl/coffer/cheque"),
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
      Uri.parse("$apiUrl/coffer/virement"),
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
      Uri.parse("$apiUrl/coffer/espaece"),
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
