// // To parse this JSON data, do
// //
// //     final productList = productListFromMap(jsonString);

// import 'dart:convert';

// List<ProductList> productListFromMap(var str) =>
//     List<ProductList>.from(str.map((x) => ProductList.fromMap(x)));

// String productListToMap(List<ProductList> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

// class ProductList {
//   ProductList({
//     required this.id,
//     required this.price,
//     required this.picture,
//     required this.colors,
//     required this.productName,
//     required this.brands,
//   });

//   final String id;
//   final String price;
//   final String picture;
//   final List<String> colors;
//   final String productName;
//   final List<Brand> brands;

//   factory ProductList.fromMap(Map<String, dynamic> json) => ProductList(
//         id: json["_id"] ?? "",
//         price: json["price"] ?? "",
//         picture: json["picture"] ?? "",
//         colors: json['colors']==null? []:List<String>.from(json["colors"].map((x) => x)),
//         productName: json["productName"] ?? "",
//         brands: json["brands"] == null ? [] : List<Brand>.from(json["brands"].map((x) => Brand.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "price": price,
//         "picture": picture,
//          "colors": List<dynamic>.from(colors.map((x) => x)),
//         "productName": productName,
//         "brands": List<dynamic>.from(brands.map((x) => x.toMap())),
//       };
// }

// class Brand {
//   Brand({
//     required this.id,
//     required this.name,
//   });

//   final int id;
//   final String name;

//   factory Brand.fromMap(Map<String, dynamic> json) => Brand(
//         id: json["id"] ?? 1,
//         name: json["name"] ?? "",
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//       };
// }

// enum Color { RED, BLUE, GREEN }

// final colorValues =
//     EnumValues({"Blue": Color.BLUE, "Green": Color.GREEN, "Red": Color.RED});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String>? get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final productList = productListFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<ProductList> productListFromMap(var str) =>
    List<ProductList>.from(str.map((x) => ProductList.fromMap(x)));

String productListToMap(List<ProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductList {
  ProductList(
      {required this.id,
      required this.price,
      required this.picture,
      required this.colors,
      required this.productName,
      required this.brands,
      this.selectedColor,
      required this.qty,
      this.selectedBrand,
      this.totalPrice});

  final String id;
  final String price;
  final String picture;
  final List<String> colors;
  final String productName;
  String? selectedColor;
  Brand? selectedBrand;
  TextEditingController qty;
  String? totalPrice;
  final List<Brand> brands;

  factory ProductList.fromMap(Map<String, dynamic> json) {
    List<Brand> brandLs = json["brands"] == null
        ? []
        : List<Brand>.from(json["brands"].map((x) => Brand.fromMap(x)));
    return ProductList(
      id: json["_id"] ?? "",
      price: json["price"] ?? "gugui",
      picture: json["picture"] ??
          "https://icon-library.com/images/add-image-icon-png/add-image-icon-png-12.jpg",
      colors: List<String>.from(json["colors"].map((x) => x)),
      productName: json["productName"] ?? "",
      brands: brandLs,
      qty: TextEditingController(),
      selectedColor: json['colors'][0],
      selectedBrand: brandLs.isNotEmpty ? brandLs[0] : null,
    );
  }
  Map<String, dynamic> toMap() => {
        "_id": id,
        "price": price,
        "picture": picture,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "productName": productName,
        "brands": List<dynamic>.from(brands.map((x) => x.toMap())),
      };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

enum Color { RED, BLUE, GREEN }

final colorValues =
    EnumValues({"Blue": Color.BLUE, "Green": Color.GREEN, "Red": Color.RED});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
