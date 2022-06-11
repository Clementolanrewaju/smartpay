// To parse this JSON data, do
//
//     final dashBoardResponse = dashBoardResponseFromJson(jsonString);

import 'dart:convert';

DashBoardResponse dashBoardResponseFromJson(String str) => DashBoardResponse.fromJson(json.decode(str));

String dashBoardResponseToJson(DashBoardResponse data) => json.encode(data.toJson());

class DashBoardResponse {
  DashBoardResponse({
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

  factory DashBoardResponse.fromJson(Map<String, dynamic> json) => DashBoardResponse(
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
    required this.secret,
  });

  String secret;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    secret: json["secret"],
  );

  Map<String, dynamic> toJson() => {
    "secret": secret,
  };
}
