import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/authentication/domain/providers/verify_email_provider.dart';
import 'package:smartpay/shared/utils/constant.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_pin_entry_field.dart';

class SignUpVerificationPage extends HookWidget {
  const SignUpVerificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isLoading = useState(false);
    final code = useState("");
    return ThemeBuilder(builder: (context, appColor, ref) {
      return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SBackButton(appColor: appColor),
                const YBox(20),
                const Text(
                  'Verify it’s you',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff111827),
                  ),
                ),
                const YBox(10),
                RichText(
                  text:  TextSpan(
                      text: 'We sent a code to(',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SfPro',
                        color: Color(0xff6B7280),
                      ),
                      children: [
                        TextSpan(
                          text:  TokenModel(email: emailValue!).email,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SfPro',
                            color: Color(0xff2F3542),
                          ),
                        ),
                        const TextSpan(
                          text: ' ).Enter it\nhere to verify your identity',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SfPro',
                            color: Color(0xff6B7280),
                          ),
                        ),
                      ]),
                ),
                const YBox(32),
                Expanded(
                  child: CustomTransactionPinEntryField(
                    onConfirm: (v) async {
                      code.value=v;
                      isLoading.value=true;
                      final p = ref.read(verifyProvider);
                      await p.verify(
                        context: context,
                        token: code.value
                      );
                      isLoading.value=false;
                    },
                    length: 5,
                  ),
                )
              ],
            ),
          ));
    });
  }
}
