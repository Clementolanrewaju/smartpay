import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/login_model.dart';
import 'package:smartpay/authentication/data/models/register_model.dart';
import 'package:smartpay/authentication/domain/repositories/authentication_repository.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/helpers/extensions/buildcontext_extension.dart';

final registerProvider = Provider((ref) {
  final repo = ref.read(authenticationRepositoryProvider);
  return RegisterProvider(repo);
});

class RegisterProvider {
  final AuthenticationRepository _repo;

  RegisterProvider(this._repo);

  Future <void> register({
     required BuildContext context,
    required String email,
    required String password,
    required String full_name,
  }) async {
    final model = RegisterModel(email: email, password: password,full_name: full_name,);
    final state = await _repo.register(model);
    // showDialog(
    //   context: context,
    //   barrierDismissible: true,
    //   builder: (_) =>  Dialog(
    //     backgroundColor: Colors.black.withOpacity(0.5),
    //     insetPadding: EdgeInsets.zero,
    //     child: SizedBox(
    //         width: double.maxFinite,
    //         height: double.maxFinite,
    //         child:  CircularProgressIndicator()
    //     ),
    //   ),
    // );
    if (state.isDone) {
      final r = state.data!;
      if (r.status= true) {
        context.showSuccess(r.message);
        pushTo(context, VerificationPage());
        return;
      }
    } else {
      print(state.message);
      context.showError(state.message!);
    }
  }
}
