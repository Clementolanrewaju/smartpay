import 'package:flutter/material.dart';
import 'package:smartpay/authentication/views/createnewpassword/create_new_password_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_pin_entry_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (_, appColor, __) {
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
              text: const TextSpan(
                  text: 'We sent a code to(',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'SfPro',
                    color: Color(0xff6B7280),
                  ),
                  children: [
                    TextSpan(
                      text: ' *****@mail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SfPro',
                        color: Color(0xff2F3542),
                      ),
                    ),
                    TextSpan(
                      text: ' ).Enter it\n here to verify your identity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SfPro',
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ]),
            ),
            YBox(32),
            Expanded(
              child: CustomTransactionPinEntryField(
                onConfirm: (code) {
                  pushTo(context, CreateNewPassWordPage());
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
