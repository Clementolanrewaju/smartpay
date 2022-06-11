import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/authentication/domain/repositories/authentication_repository.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/authentication/views/signup/signup_verification_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/helpers/extensions/buildcontext_extension.dart';
import 'package:smartpay/shared/utils/constant.dart';
import 'package:smartpay/shared/utils/dims.dart';

final tokenProvider = Provider((ref) {
  final repo = ref.read(authenticationRepositoryProvider);
  return TokenProvider(repo);
});

class TokenProvider {
  final AuthenticationRepository _repo;

  TokenProvider(this._repo);

  Future <void> token({
    required BuildContext context,
    required String email,
  }) async {
    final model = TokenModel(email: email,);
    final state = await _repo.token(model);
    if (state.isDone) {
      final r = state.data!;
      if (r.status = true) {
        await showDialog(
          barrierLabel: 'TOKEN',
          context: context,
          barrierDismissible: true,
          builder: (_) =>  Dialog(
            backgroundColor: Colors.black.withOpacity(0.5),
            insetPadding: EdgeInsets.zero,
            child: SizedBox(
                width: context.deviceWidth(),
                height: 100,
                child:  Column(
                  children: [
                    Center(
                      child: Text('HERE IS YOUR TOKEN!!!',style: TextStyle( fontFamily: 'SfPro',
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Color(0xff111827),),),
                    ),
                    Text(r.data.token,style: TextStyle( fontFamily: 'SfPro',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xff111827),),),
                  ],
                )
            ),
          ),
        );
        pushTo(context, SignUpVerificationPage());
        return;
      }
    } else {
      context.showError(state.message!);
    }
  }
}
