class Livraison {
  int? id;
  String? reference;
  int? commandeId;
  Commande? commande;

  Livraison({this.id, this.reference, this.commandeId, this.commande});

  Livraison.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    commandeId = json['commande_id'];
    commande =
        json['commande'] != null ? Commande.fromJson(json['commande']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reference'] = reference;
    data['commande_id'] = commandeId;
    if (commande != null) {
      data['commande'] = commande!.toJson();
    }
    return data;
  }
}

class Commande {
  int? id;
  String? reference;
  String? etat;
  String? distination;
  int? quantit;
  int? remise;
  int? totalHorsTaxe;
  int? totalFodac;
  int? totalTva;
  int? totalTimbre;
  int? totalTtc;
  int? clientId;
  int? fournisseurId;
  int? bonLivraisionId;
  int? factureId;
  String? createdAt;
  String? updatedAt;
  Client? client;
  Fournisseur? fournisseur;
  List<Article>? article;

  Commande(
      {this.id,
      this.reference,
      this.etat,
      this.distination,
      this.quantit,
      this.remise,
      this.totalHorsTaxe,
      this.totalFodac,
      this.totalTva,
      this.totalTimbre,
      this.totalTtc,
      this.clientId,
      this.fournisseurId,
      this.bonLivraisionId,
      this.factureId,
      this.createdAt,
      this.updatedAt,
      this.client,
      this.fournisseur,
      this.article});

  Commande.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    etat = json['etat'];
    distination = json['distination'];
    quantit = json['quantité'];
    remise = json['remise'];
    totalHorsTaxe = json['total_hors_taxe'];
    totalFodac = json['total_fodac'];
    totalTva = json['total_tva'];
    totalTimbre = json['total_timbre'];
    totalTtc = json['total_ttc'];
    clientId = json['client_id'];
    fournisseurId = json['fournisseur_id'];
    bonLivraisionId = json['bon_livraision_id'];
    factureId = json['facture_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    fournisseur = json['fournisseur'] != null
        ? Fournisseur.fromJson(json['fournisseur'])
        : null;
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reference'] = reference;
    data['etat'] = etat;
    data['distination'] = distination;
    data['quantité'] = quantit;
    data['remise'] = remise;
    data['total_hors_taxe'] = totalHorsTaxe;
    data['total_fodac'] = totalFodac;
    data['total_tva'] = totalTva;
    data['total_timbre'] = totalTimbre;
    data['total_ttc'] = totalTtc;
    data['client_id'] = clientId;
    data['fournisseur_id'] = fournisseurId;
    data['bon_livraision_id'] = bonLivraisionId;
    data['facture_id'] = factureId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (fournisseur != null) {
      data['fournisseur'] = fournisseur!.toJson();
    }
    if (article != null) {
      data['article'] = article!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Client {
  int? id;
  String? nom;
  String? prenom;
  String? adresse;
  String? telephone;
  int? chifreAffaire;
  int? commandeId;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.nom,
      this.prenom,
      this.adresse,
      this.telephone,
      this.chifreAffaire,
      this.commandeId,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    chifreAffaire = json['chifre_affaire'];
    commandeId = json['commande_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['adresse'] = adresse;
    data['telephone'] = telephone;
    data['chifre_affaire'] = chifreAffaire;
    data['commande_id'] = commandeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Fournisseur {
  int? id;
  String? nom;
  String? adresse;
  String? telephone;
  int? commandeId;
  String? createdAt;
  String? updatedAt;

  Fournisseur(
      {this.id,
      this.nom,
      this.adresse,
      this.telephone,
      this.commandeId,
      this.createdAt,
      this.updatedAt});

  Fournisseur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    adresse = json['adresse'];
    telephone = json['telephone'];
    commandeId = json['commande_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['adresse'] = adresse;
    data['telephone'] = telephone;
    data['commande_id'] = commandeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Article {
  int? id;
  String? nomArticle;
  String? description;
  int? prixUnitaire;
  int? stock;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Article(
      {this.id,
      this.nomArticle,
      this.description,
      this.prixUnitaire,
      this.stock,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomArticle = json['nom_article'];
    description = json['description'];
    prixUnitaire = json['prix_unitaire'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom_article'] = nomArticle;
    data['description'] = description;
    data['prix_unitaire'] = prixUnitaire;
    data['stock'] = stock;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? commandeId;
  int? articleId;

  Pivot({this.commandeId, this.articleId});

  Pivot.fromJson(Map<String, dynamic> json) {
    commandeId = json['commande_id'];
    articleId = json['article_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commande_id'] = commandeId;
    data['article_id'] = articleId;
    return data;
  }
}
