

import 'package:smartpay/shared/utils/constant.dart';

class TokenModel {
  final String email;

  TokenModel({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
    };
  }
}