// To parse this JSON data, do
//
//     final verifyEmailResponse = verifyEmailResponseFromJson(jsonString);

import 'dart:convert';

VerifyEmailResponse verifyEmailResponseFromJson(String str) => VerifyEmailResponse.fromJson(json.decode(str));

String verifyEmailResponseToJson(VerifyEmailResponse data) => json.encode(data.toJson());

class VerifyEmailResponse {
  VerifyEmailResponse({
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

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) => VerifyEmailResponse(
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
    required this.email,
  });

  String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
