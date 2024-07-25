import 'dart:convert';

List<ProductModel> productModelFromMap(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromMap(x)));

String productModelToMap(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel {
  String type;
  String title;
  List<Content>? contents;
  String? id;
  String? imageUrl;

  ProductModel({
    required this.type,
    required this.title,
    this.contents,
    this.id,
    this.imageUrl,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        type: json["type"],
        title: json["title"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromMap(x))),
        id: json["id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "title": title,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toMap())),
        "id": id,
        "image_url": imageUrl,
      };
}

class Content {
  String? title;
  String? imageUrl;
  String? sku;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;
  String? productName;

  Content({
    this.title,
    this.imageUrl,
    this.sku,
    this.productImage,
    this.productRating,
    this.actualPrice,
    this.offerPrice,
    this.discount,
    this.productName,
  });

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        title: json["title"],
        imageUrl: json["image_url"],
        sku: json["sku"],
        productImage: json["product_image"],
        productRating: json["product_rating"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        productName: json["product_name"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "image_url": imageUrl,
        "sku": sku,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
        "product_name": productName,
      };
}
