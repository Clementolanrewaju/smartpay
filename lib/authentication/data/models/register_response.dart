// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  bool status;
  String message;
  Data data;
  List<dynamic> meta;
  List<dynamic> pagination;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "pagination": List<dynamic>.from(pagination.map((x) => x)),
  };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.fullName,
    required this.username,
    required this.email,
    required this.country,
    required this.id,
  });

  String fullName;
  String username;
  String email;
  String country;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json["full_name"],
    username: json["username"],
    email: json["email"],
    country: json["country"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "username": username,
    "email": email,
    "country": country,
    "id": id,
  };
}
