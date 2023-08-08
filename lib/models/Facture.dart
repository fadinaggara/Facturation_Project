class Facture {
  int? id;
  String? reference;
  String? etat;
  int? commandeId;
  String? updatedAt;
  Commande? commande;

  Facture(
      {this.id,
      this.reference,
      this.etat,
      this.commandeId,
      this.updatedAt,
      this.commande});

  Facture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    etat = json['etat'];
    commandeId = json['commande_id'];
    updatedAt = json['updated_at'];
    commande = json['commande'] != null
        ? Commande.fromJson(json['commande'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reference'] = reference;
    data['etat'] = etat;
    data['commande_id'] = commandeId;
    data['updated_at'] = updatedAt;
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
  String? client;
  String? fournisseur;
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
    client = json['clienttt'];
    fournisseur = json['fournisseur'];
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
    data['clienttt'] = client;
    data['fournisseur'] = fournisseur;
    if (article != null) {
      data['article'] = article!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  int? id;
  String? nomArticle;
  String? description;
  int? prixUnitaire;
  int? stock;
  Null? createdAt;
  Null? updatedAt;
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
