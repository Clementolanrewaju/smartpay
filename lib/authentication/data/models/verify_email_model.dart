

import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/shared/utils/constant.dart';

class VerifyEmailModel {
  final String token;

  VerifyEmailModel({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": TokenModel(email: emailValue!).email,
      "token":token
    };
  }
}