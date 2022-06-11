import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/theme/app_colors.dart';


class SBackButton extends StatelessWidget {
  final AppColor appColor;
  const SBackButton({
    Key? key,
    required this.appColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pop(context);
      },
      child:SvgPicture.asset('images/BackButton.svg'),
    );
  }
}
