// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  List<DataList>? productData;

  UserResponse({
    this.productData,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    productData: json["ProductData"] == null ? [] : List<DataList>.from(json["ProductData"]!.map((x) => DataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ProductData": productData == null ? [] : List<dynamic>.from(productData!.map((x) => x.toJson())),
  };
}

class DataList {
  String? id;
  String? categoryName;
  String? name;
  String? price;
  String? image;
  String? averageRating;

  DataList({
    this.id,
    this.categoryName,
    this.name,
    this.price,
    this.image,
    this.averageRating,
  });

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    id: json["Id"],
    categoryName: json["CategoryName"],
    name: json["Name"],
    price: json["Price"],
    image: json["Image"],
    averageRating: json["AverageRating"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
    "Name": name,
    "Price": price,
    "Image": image,
    "AverageRating": averageRating,
  };
}
