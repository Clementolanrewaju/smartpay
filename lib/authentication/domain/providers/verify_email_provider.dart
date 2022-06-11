import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/verify_email_model.dart';
import 'package:smartpay/authentication/domain/repositories/authentication_repository.dart';
import 'package:smartpay/authentication/views/signup/email_verified_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/helpers/extensions/buildcontext_extension.dart';

final verifyProvider = Provider((ref) {
  final repo = ref.read(authenticationRepositoryProvider);
  return VerifyProvider(repo);
});

class VerifyProvider {
  final AuthenticationRepository _repo;

  VerifyProvider(this._repo);

  Future <void> verify({
    required BuildContext context,
    required String token,
  }) async {
    final model = VerifyEmailModel(token: token);
    final state = await _repo.verify(model);
    if (state.isDone) {
      final r = state.data!;
      if (r.status = true) {
        pushTo(context,EmailVerifiedPage());
        return;
      }
    } else {
      context.showError(state.message!);
    }
  }
}
