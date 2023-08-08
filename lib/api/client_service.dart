import 'dart:convert';
import 'package:last/helpers/shared_prefs.dart';
import 'package:last/models/Client.dart';
import 'package:http/http.dart' as http;
import '../constants/config.dart';

class ClientService {
  static Future<List<ClientModel>?> getAllClient() async {
    final token = await SharedPreferencesHelper.getString('token');
    try {
      final response = await http.get(
        Uri.parse("$apiUrl/client/"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token!}',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final clientData = jsonData['clients'] as List<dynamic>;
        final clients = clientData.map((client) {
          try {
            return ClientModel.fromJson(client);
          } catch (e) {
            print('Error parsing client: $e');
            return null;
          }
        }).whereType<ClientModel>().toList();

        return clients.isNotEmpty ? clients : null;
      } else {
        print('Request failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
