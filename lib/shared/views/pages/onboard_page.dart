import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/authentication/views/login/login_page.dart';
import 'package:smartpay/core/navigation/navigator.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/widgets/custom_button.dart';
import 'package:smartpay/shared/views/widgets/pageview_indicators.dart';
import 'package:smartpay/shared/views/theme_builder.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return ThemeBuilder(
      builder: (_, appColor, __) {
        List<_OnboaringItem> items = [
          _OnboaringItem(
            title: "Finance app the safest\n and most trusted",
            description:
                "Your finance work starts here. Our here to help\n you track and deal with speeding up your\n transactions.",
            centerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const YBox(34),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Transform.scale(
                        scale: 0.8,
                        child: Image.asset('images/device.png')),
                    Positioned.fill(
                      right: -140,
                      top: -50,
                      child: Image.asset('images/ThisMonth.png'),
                    ),
                    Positioned.fill(
                      left: -230,
                      top: -380,
                      child: Image.asset('images/sheild.png'),
                    ),
                    Positioned.fill(
                      left: -190,
                      bottom: -20,
                      child: Image.asset('images/DirectDeposit.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _OnboaringItem(
            title: "The fastest transaction\n process only here",
            description:
                "Get easy to pay all your bills with just a few\n steps. Paying your bills become fast and\n efficient.",
            centerWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const YBox(10),
               Stack(
                 clipBehavior: Clip.none,
                 children: [
                   Transform.scale(
                       scale: 0.7,
                       child: Image.asset('images/image-2.png')),
                   Positioned.fill(
                     left: 180,
                     top: 10,
                     child: Image.asset('images/contact.png'),
                   ),
                   Positioned.fill(
                     left: -150,
                     top: -180,
                     child: Image.asset('images/master.png'),
                   ),
                 ],
               ),
              ],
            ),
          ),
        ];
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (v) {
                    setState(() {
                      _index = v;
                    });
                  },
                  children: items.map(
                    (item) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20,top: 3),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    pushTo(context, const LoginPage());
                                  },
                                  child: Text('skip',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SfPro',
                                    color: Color(0xffFFC08A),
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: item.centerWidget ??
                                      const SizedBox.shrink(),
                                ),
                              ),
                              Positioned(
                                top: context.deviceHeight() / 2.1,
                                height: context.deviceHeight() / 2.1,
                                child: Container(
                                  width: context.deviceWidth(),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const YBox(66),
                                      Text(item.title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'SfPro',
                                            color: Color(0xff111827),
                                          )),
                                      const YBox(16),
                                      Text(
                                        item.description,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'SfPro',
                                          color: Color(0xff6B7280),
                                        ),
                                      ),
                                      const YBox(16),
                                      PageviewIndicators(
                                        index: _index,
                                        appColor: appColor,
                                        count: 2,
                                      ),
                                      YBox(34),
                                      CustomButton(
                                          padding: EdgeInsets.only(
                                              left: 44, right: 44),
                                          radius: BorderRadius.circular(16),
                                          expanded: true,
                                          text: 'Get Started',
                                          appColor: appColor,
                                          isLoading:isLoading,
                                          onPressed: () {
                                            if (_index == 1) {
                                              pushTo(context, const LoginPage());
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                                _index++;
                                                _pageController.animateToPage(
                                                  _index,
                                                  duration: const Duration(milliseconds: 400),
                                                  curve: Curves.easeIn,
                                                );
                                              });
                                            }
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _index = 0;
  final PageController _pageController = PageController();
}

class _OnboaringItem {
  final String title;
  final String description;
  final Widget? centerWidget;
  _OnboaringItem({
    required this.title,
    required this.description,
    this.centerWidget,
  });
}
