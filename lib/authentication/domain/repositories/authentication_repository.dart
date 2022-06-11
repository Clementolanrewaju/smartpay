import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/authentication/data/models/get_token_response_model.dart';
import 'package:smartpay/authentication/data/models/login_model.dart';
import 'package:smartpay/authentication/data/models/login_response_model.dart';
import 'package:smartpay/authentication/data/models/register_model.dart';
import 'package:smartpay/authentication/data/models/register_response.dart';
import 'package:smartpay/authentication/data/models/verify_email_model.dart';
import 'package:smartpay/authentication/data/models/verify_email_model_response.dart';
import 'package:smartpay/authentication/domain/services/online/authentication_service.dart';
import 'package:smartpay/core/framework/base_notifier.dart';
import 'package:smartpay/core/framework/convert_functions.dart';

final authenticationRepositoryProvider = Provider((ref) {
  return AuthenticationRepository();
});

class AuthenticationRepository {
  FutureNotifierState<LoginResponse> login(LoginModel model) {
    return convertWithArgument(AuthenticationService.login, model);
  }
  FutureNotifierState<RegisterResponse> register(RegisterModel model) {
    return convertWithArgument(AuthenticationService.register, model);
  }
  FutureNotifierState<GetTokenResponse> token(TokenModel model) {
    return convertWithArgument(AuthenticationService.token, model);
  }
  FutureNotifierState<VerifyEmailResponse> verify(VerifyEmailModel model) {
    return convertWithArgument(AuthenticationService.verify, model);
  }
}
