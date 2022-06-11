import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/authentication/views/login/login_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';

class NewPassWordCreatedPage extends StatefulWidget {
  const NewPassWordCreatedPage({Key? key}) : super(key: key);

  @override
  State<NewPassWordCreatedPage> createState() => _NewPassWordCreatedPageState();
}

class _NewPassWordCreatedPageState extends State<NewPassWordCreatedPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (_, appColor, __){
      return SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YBox(90),
            SvgPicture.asset('images/illustration.svg'),
            YBox(57),
            const Center(
              child:  Text(
                'New Password Created',
                style: TextStyle(
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff111827),
                ),
              ),
            ),
            YBox(20),
            const Center(
              child:  Text(
                'Hey Anabel, your password has been\n successfuly updated.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
              ),
            ),
            YBox(context.deviceHeight()/4),
            CustomButton(
              expanded: true,
              text: 'Proceed to home',
              appColor: appColor,
              onPressed: () {
                pushToAndClearStack(context, LoginPage());
              },
              radius: BorderRadius.circular(16),
              padding: const EdgeInsets.only(left: 0, right: 0),
            ),
          ],
        ),
      ));
    });
  }
}
