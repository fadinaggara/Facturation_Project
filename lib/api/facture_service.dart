import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/constants/config.dart';
import '../helpers/shared_prefs.dart';
import '../models/Facture.dart';

class FactureService {
  static Future<List<Facture>?> consulterListeBonLivraision() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/facture/"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      var listOfLivraison = jsonDecode(response.body)["liste_factures"];
      List<Facture> listOfLivraisonConverted = [];
      listOfLivraison.forEach((e) {
        return listOfLivraisonConverted.add(Facture.fromJson(e));
      });
      return listOfLivraisonConverted;
    } else {
      return null;
    }
  }
}
