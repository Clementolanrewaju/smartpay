import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/authentication/data/models/get_token_model.dart';
import 'package:smartpay/authentication/views/signup/signup_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/constant.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';



class EmailVerifiedPage extends StatefulWidget {
  const EmailVerifiedPage({Key? key}) : super(key: key);

  @override
  State<EmailVerifiedPage> createState() => _EmailVerifiedPageState();
}

class _EmailVerifiedPageState extends State<EmailVerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(builder: (_, appColor, __){
      return SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const YBox(90),
            SvgPicture.asset('images/illustration.svg'),
            const YBox(57),
            const Center(
              child:  Text(
                'Email Verified!!!',
                style: TextStyle(
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff111827),
                ),
              ),
            ),
            const YBox(20),
             Center(
              child:  Text(
                'Hey ${TokenModel(email: emailValue!).email}, your email has been\n successfully verified.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color:  Color(0xff6B7280),
                ),
              ),
            ),
            YBox(context.deviceHeight()/4),
            CustomButton(
              expanded: true,
              text: 'Proceed to signUp',
              appColor: appColor,
              onPressed: () {
                pushToAndClearStack(context, const SignUpPage());
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
