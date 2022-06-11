import 'package:flutter/material.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/custom_text_field.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (_, appColor, __) {
      return SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SBackButton(appColor: appColor),
                const YBox(20),
                const Text(
                  'Passsword Recovery',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff111827),
                  ),
                ),
                const YBox(10),
                const Text(
                  'Enter your registered email below to receive password instructions',
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
                        keyboardType: TextInputType.emailAddress,
                        hintstyle: const TextStyle(
                          fontFamily: 'SfPro',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff9CA3AF),
                        ),),
                      YBox(context.deviceHeight()/2),
                      CustomButton(
                        expanded: true,
                        text: 'Send verification code',
                        appColor: appColor,
                        // validator: () {
                        //   return email.value.isNotEmpty &&
                        //       password.value.isNotEmpty;
                        // },
                        onPressed: () {
                          pushTo(context, VerificationPage());
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
