import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay/authentication/domain/providers/register_provider.dart';
import 'package:smartpay/authentication/views/login/login_page.dart';
import 'package:smartpay/authentication/views/password_recovery/verification_Page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/custom_text_field.dart';

import 'signup_verification_page.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isLoading = useState(false);
    final email = useState("");
    final password = useState("");
    final full_name = useState("");
    return ThemeBuilder(builder: (context, appColor, ref){
      return SafeArea(child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SBackButton(appColor: appColor),
            const YBox(20),
             RichText(
              text:TextSpan(
                text: 'Create a ',
                style: TextStyle(
                  fontFamily: 'SfPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff111827),
                ),
                children: [
                  TextSpan(
                    text: 'Smartpay',
                    style: TextStyle(
                      fontFamily: 'SfPro',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xffFFAB63),
                    ),
                  )
                ]
              ),
            ),
            const Text(
              'account',
              style: TextStyle(
                fontFamily: 'SfPro',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff111827),
              ),
            ),
            YBox(32),
            Expanded(child: ListView(
              children: [
                CustomTextField(
                  onChanged: (v) {
                    full_name.value = v;
                  },
                  appColor: appColor,
                  radius: BorderRadius.circular(
                    16,
                  ),
                  hint: 'Full name',
                  hintstyle: const TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff9CA3AF),
                  ),
                ),
                const YBox(16),
                CustomTextField(
                  onChanged: (v) {
                    email.value = v;
                  },
                  appColor: appColor,
                  hint: 'Email',
                  hintstyle: const TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff9CA3AF),
                  ),
                ),
                YBox(16),
                CustomTextField(
                  onChanged: (v) {
                    password.value = v;
                  },
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
                ),
                const YBox(24),
                CustomButton(
                  isLoading: isLoading.value,
                  expanded: true,
                  text: 'Sign Up',
                  appColor: appColor,
                  validator: () {
                    return email.value.isNotEmpty &&
                        password.value.isNotEmpty && full_name.value.isNotEmpty;
                  },
                  onPressed: () async {
                    isLoading.value=true;
                    final p = ref.read(registerProvider);
                    await p.register(
                      context: context,
                      email: email.value,
                      password: password.value,
                      full_name:full_name.value,
                    );
                    isLoading.value=false;
                  },
                  radius: BorderRadius.circular(16),
                  padding: const EdgeInsets.only(left: 0, right: 0),
                ),
                const YBox(42.5),
                Row(
                  children: [
                    Image.asset('images/line.png'),
                    const Spacer(),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    const Spacer(),
                    Image.asset('images/line-2.png'),
                  ],
                ),
                const YBox(34.5),
                Row(
                  children: [
                    GestureDetector(
                        child: SvgPicture.asset('images/GoogleButton.svg')),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('images/AppleButton.svg'))
                  ],
                ),
                const YBox(100),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      pushTo(context, LoginPage());
                    },
                    child: RichText(
                      text: const TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SfPro',
                            color: Color(0xff6B7280),
                          ),
                          children: [
                            TextSpan(
                              text: '  Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'SfPro',
                                color: Color(0xffFFCB9D),
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ));
    });
  }
}
