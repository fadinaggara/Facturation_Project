import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/constants/config.dart';
import 'package:last/models/Livraison.dart';


import '../helpers/shared_prefs.dart';

class LivraisonService {
  static Future<List<Livraison>?> consulterListeBonLivraision() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/livraision"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      var listOfLivraison = jsonDecode(response.body)["liste_bon_livraision"];
      List<Livraison> listOfLivraisonConverted = [];
      listOfLivraison.forEach((e) {
        return listOfLivraisonConverted.add(Livraison.fromJson(e));
      });
      return listOfLivraisonConverted;
    } else {
      return null;
    }
  }
}
