class ClientModel {
  int? id;
  String? nom;
  String? prenom;
  String? adresse;
  String? telephone;
  String? chiff;
  double? chiffreAffaire;


  ClientModel({
    this.id,
    this.nom,
    this.prenom,
    this.adresse,
    this.telephone,
    this.chiff,
    double? chiffreAffaire,

  }) : chiffreAffaire = chiffreAffaire ?? 0;

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      adresse: json['adresse'],
      telephone: json['telephone'],
      chiff: json['chiffreaffaire'],
      chiffreAffaire: json['commande_id']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['adresse'] = adresse;
    data['telephone'] = telephone;
    data['chiffreaffaire'] = chiff;
    data['commande_id'] = chiffreAffaire;
    return data;
  }
}
