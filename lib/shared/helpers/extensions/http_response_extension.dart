import 'package:http/http.dart';

extension Extras on Response {
  bool get is200 => statusCode == 200;
  bool get is201 => statusCode == 201;
  bool get is202 => statusCode == 202;
  bool get is400 => statusCode == 400;
  bool get is409 => statusCode == 409;
  bool get is500 => statusCode == 500;
  bool get is401 => statusCode == 401;
}
