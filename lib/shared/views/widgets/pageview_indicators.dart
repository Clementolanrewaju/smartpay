import 'package:flutter/material.dart';
import 'package:smartpay/shared/utils/theme/app_colors.dart';


class PageviewIndicators extends StatelessWidget {
  const PageviewIndicators({
    Key? key,
    required int index,
    required this.count,
    required this.appColor,
    this.mainAxisAlignment,
  })  : _index = index,
        super(key: key);

  final int _index;
  final int count;
  final AppColor appColor;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center ,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: index == _index ? 50 : 7,
          height: 7,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            color: index == _index
                ? appColor.primaryColor
                : appColor.secondaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
