import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:smartpay/authentication/data/models/dashboard_response.dart';
import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/authentication/data/models/get_token_response_model.dart';
import 'package:smartpay/authentication/data/models/login_model.dart';
import 'package:smartpay/authentication/data/models/login_response_model.dart';
import 'package:smartpay/authentication/data/models/register_model.dart';
import 'package:smartpay/authentication/data/models/register_response.dart';
import 'package:smartpay/authentication/data/models/verify_email_model.dart';
import 'package:smartpay/authentication/data/models/verify_email_model_response.dart';
import 'package:smartpay/core/framework/service_response.dart';
import 'package:smartpay/shared/helpers/classes/HTTP/HTTP.dart';
import 'package:smartpay/shared/helpers/extensions/http_response_extension.dart';
import 'package:smartpay/shared/utils/constant.dart';

class AuthenticationService {
  static FutureResponse<LoginResponse> login(LoginModel model) {
    return serveFuture<LoginResponse>(
      function: (fail) async {
        final r = await HTTP.post("auth/login", body: model.toMap());

        if (kDebugMode) {
          print(r.statusCode);
          print(r.body);
          print(model.toMap());
        }
        if (r.is200) {
          final body = jsonDecode(r.body);
          final token = body['token'];

          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer $token",
          );
          var x = LoginResponse.fromJson(Map.from(body));
          tokenVal = x.data.token;
          return x;
        }
        if (r.is401) {
          fail("Invalid email or password");
        }
        fail("Something went wrong");
      },
    );
  }
  static FutureResponse<RegisterResponse> register(RegisterModel model) {
    return serveFuture<RegisterResponse>(
      function: (fail) async {
        final r = await HTTP.post("auth/register", body: model.toMap());
        if (kDebugMode) {
          print(r.body);
          print(r.statusCode);
          print(model.toMap());
        }
        if (r.is200) {
          final body = jsonDecode(r.body);
          final token = body['token'];
          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer $token",
          );
          print(body);
          return RegisterResponse.fromJson(Map.from(body));
        }
        if (r.is401) {
          fail("Invalid email or password");
        }
        fail("Something went wrong");
      },
    );
  }
  static FutureResponse<GetTokenResponse> token(TokenModel model) {
    return serveFuture<GetTokenResponse>(
      function: (fail) async {
        final r = await HTTP.post("auth/email", body: model.toMap());
        if(kDebugMode){
          print(r.body);
          print(r.statusCode);
          print(model.toMap());
        }
        if (r.is200) {
          final body = jsonDecode(r.body);
          final token = body['token'];
          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer $token",
          );
          return GetTokenResponse.fromJson(Map.from(body));
        }
        if (r.is401) {
          fail("Invalid email or password");
        }
        fail("Something went wrong");
      },
    );
  }
  static FutureResponse<VerifyEmailResponse> verify(VerifyEmailModel model) {
    return serveFuture<VerifyEmailResponse>(
      function: (fail) async {
        final r = await HTTP.post("auth/email/verify", body: model.toMap());
        if (kDebugMode){
          print(r.body);
          print(r.statusCode);
          print(model.toMap());
        }
        if (r.is200) {
          final body = jsonDecode(r.body);
          final token = body['token'];
          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer $token",
          );
          return VerifyEmailResponse.fromJson(Map.from(body));
        }
        if (r.is401) {
          fail("Invalid email or password");
        }
        fail("Something went wrong");
      },
    );
  }

}
class DashBoardService{
  static FutureResponse<DashBoardResponse> dashboard() async{
    return serveFuture<DashBoardResponse>(
      function: (fail) async {
        final r = await HTTP.get("auth/dashboard");
        if (kDebugMode){
          print(r.body);
          print(r.statusCode);
        }
        if (r.is200) {
          final body = jsonDecode(r.body);
          final token = tokenVal;
          HTTP.addHeader(
            key: "Authorization",
            value: "Bearer $token",
          );
          return DashBoardResponse.fromJson(Map.from(body));
        }
        if (r.is401) {
          fail("Invalid email or password");
        }
        fail("Something went wrong");
      },
    );
  }

}
