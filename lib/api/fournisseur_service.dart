import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/constants/config.dart';
import '../helpers/shared_prefs.dart';
import '../models/Facture.dart';

class FournisseurService {
  static Future<List<Facture>?> getAllValide() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/fournisseur/valide"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      var listOfLivraison = jsonDecode(response.body)["commande_validé"];
      List<Facture> listOfLivraisonConverted = [];
      listOfLivraison.forEach((e) {
        return listOfLivraisonConverted.add(Facture.fromJson(e));
      });
      return listOfLivraisonConverted;
    } else {
      return null;
    }
  }

  static Future<List<Facture>?> getAllNonValide() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/fournisseur/non_valide"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      },
    );

    if (response.statusCode == 200) {
      var listOfLivraison = jsonDecode(response.body)["commande_nonvalidé"];
      List<Facture> listOfLivraisonConverted = [];
      listOfLivraison.forEach((e) {
        return listOfLivraisonConverted.add(Facture.fromJson(e));
      });
      return listOfLivraisonConverted;
    } else {
      return null;
    }
  }

  static Future<List<Facture>?> getFacture() async {
    final token = await SharedPreferencesHelper.getString('token');
    final response = await http.get(
      Uri.parse("$apiUrl/fournisseur/facture"),
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
