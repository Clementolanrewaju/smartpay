import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/views/pages/onboard_page.dart';
import 'package:smartpay/shared/views/theme_builder.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends  ConsumerState<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
          () {
        pushTo(context, const OnboardingPage());
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (_, appColor, __) {
        return Center(
          child: SvgPicture.asset('images/logo.svg')
        );
      },
    );
  }
}
