import 'package:flutter/material.dart';
import 'package:smartpay/authentication/views/createnewpassword/new_password_created_page.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/custom_text_field.dart';

class CreateNewPassWordPage extends StatefulWidget {
  const CreateNewPassWordPage({Key? key}) : super(key: key);

  @override
  State<CreateNewPassWordPage> createState() => _CreateNewPassWordPageState();
}

class _CreateNewPassWordPageState extends State<CreateNewPassWordPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (_, appColor, __) {
      return SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SBackButton(appColor: appColor),
            YBox(30),
            const Text(
              'Create New Password',
              style: TextStyle(
                fontFamily: 'SfPro',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff111827),
              ),
            ),
            YBox(10),
            Text(
              'Please, enter a new password below different\nfrom the previous password',
              style: TextStyle(
                fontFamily: 'SfPro',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff6B7280),
              ),
            ),
            YBox(20),
            Expanded(
                child: ListView(
              children: [
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  appColor: appColor,
                  radius: BorderRadius.circular(
                    16,
                  ),
                  hint: 'Password',
                  hintstyle: const TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff9CA3AF),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                YBox(16),
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  appColor: appColor,
                  radius: BorderRadius.circular(
                    16,
                  ),
                  hint: 'Confirm password',
                  hintstyle: const TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff9CA3AF),
                  ),
                ),
                YBox(context.deviceHeight()/2.5),
                CustomButton(
                  expanded: true,
                  text: 'Create new password',
                  appColor: appColor,
                  // validator: () {
                  //   return email.value.isNotEmpty &&
                  //       password.value.isNotEmpty;
                  // },
                  onPressed: () {
                    pushTo(context, NewPassWordCreatedPage());
                  },
                  radius: BorderRadius.circular(16),
                  padding: const EdgeInsets.only(left: 0, right: 0),
                ),
              ],
            ))
          ],
        ),
      ));
    });
  }
}
