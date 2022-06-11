import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/login_model.dart';
import 'package:smartpay/authentication/domain/repositories/authentication_repository.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/helpers/extensions/buildcontext_extension.dart';

final loginProvider = Provider((ref) {
  final repo = ref.read(authenticationRepositoryProvider);
  return LoginProvider(repo);
});

class LoginProvider {
  final AuthenticationRepository _repo;

  LoginProvider(this._repo);

  Future <void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final model = LoginModel(email: email, password: password);
    final state = await _repo.login(model);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>  Dialog(
        backgroundColor: Colors.black.withOpacity(0.5),
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child:  CircularProgressIndicator()
        ),
      ),
    );
    if (state.isDone) {
      pop(context);
      final r = state.data!;
      if (r.status = true) {
        pushTo(context, VerificationPage());
        return;
      }
    } else {
      context.showError(state.message!);
    }
  }
}
