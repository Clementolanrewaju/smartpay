import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/authentication/domain/providers/login_provider.dart';
import 'package:smartpay/authentication/views/get_token/get_token_page.dart';
import 'package:smartpay/authentication/views/password_recovery/password_recovery.dart';
import 'package:smartpay/authentication/views/signup/signup_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/back_button.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/custom_text_field.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoading = useState(false);
    final email = useState("");
    final password = useState("");
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
                  'Hi There!👋 ',
                  style: TextStyle(
                    fontFamily: 'SfPro',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff111827),
                  ),
                ),
                const YBox(10),
                const Text(
                  'Welcome back, Sign in to your account',
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
                      const YBox(32),
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
                      const YBox(16),
                      CustomTextField(
                        suffix: Icon(Icons.add),
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
                      GestureDetector(
                        onTap: (){
                          pushTo(context, PasswordRecoveryPage());
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'SfPro',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xffFFAB63),
                          ),
                        ),
                      ),
                      const YBox(24),
                      CustomButton(
                        isLoading: isLoading.value,
                        expanded: true,
                        text: 'Sign In',
                        appColor: appColor,
                        validator: () {
                          return email.value.isNotEmpty &&
                              password.value.isNotEmpty;
                        },
                        onPressed: () async {
                          isLoading.value=true;
                          final p = ref.read(loginProvider);
                          await p.login(
                            context: context,
                            email: email.value,
                            password: password.value,
                          );
                          isLoading.value=false;
                        },
                        radius: BorderRadius.circular(16),
                        padding: const EdgeInsets.only(left: 0, right: 0),
                      ),
                      const YBox(20),
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
                      const YBox(15),
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
                      const YBox(175),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            pushTo(context, GetTokenPage());
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Don’t have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SfPro',
                                color: Color(0xff6B7280),
                              ),
                              children: [
                                TextSpan(
                                  text: '  Sign Up',
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
                  ),
                )
              ],
            ),
          ));
    });
  }
}
