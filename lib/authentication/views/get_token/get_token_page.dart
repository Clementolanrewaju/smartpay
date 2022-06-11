import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartpay/authentication/domain/providers/get_token_provider.dart';
import 'package:smartpay/shared/utils/constant.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/custom_text_field.dart';

class GetTokenPage extends HookWidget {
  const GetTokenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isLoading = useState(false);
    final emailVal = useState("");
    return ThemeBuilder(builder: (context, appColor, ref) {
      return SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SBackButton(appColor: appColor),
                const YBox(20),
                const Text(
                  'Get Token For SignUp',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff111827),
                  ),
                ),
                const YBox(10),
                const Text(
                  'Enter your registered email below to receive token for signUp',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff6B7280),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      YBox(32),
                      CustomTextField( appColor: appColor,
                        border: const Border.fromBorderSide(BorderSide.none),
                        radius: BorderRadius.circular(
                          16,
                        ),
                        hint: 'Email',
                        onChanged: (v) {
                          emailVal.value = v;
                         emailValue=v;
                        },
                        keyboardType: TextInputType.emailAddress,
                        hintstyle: const TextStyle(
                          fontFamily: 'SfPro',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff9CA3AF),
                        ),),
                      YBox(context.deviceHeight()/2),
                      CustomButton(
                        isLoading: isLoading.value,
                        expanded: true,
                        text: 'Send verification code',
                        appColor: appColor,
                        validator: () {
                          return emailVal.value.isNotEmpty;
                        },
                        onPressed: () async {
                          isLoading.value=true;
                          final p = ref.read(tokenProvider);
                          await p.token(
                            context: context,
                            email: emailVal.value,
                          );
                          print('emailis${emailVal}');
                          isLoading.value=false;
                        },
                        radius: BorderRadius.circular(16),
                        padding: const EdgeInsets.only(left: 0, right: 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
