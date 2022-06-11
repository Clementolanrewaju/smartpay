import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay/shared/utils/dims.dart';
import 'package:smartpay/shared/views/theme_builder.dart';
import 'package:smartpay/shared/views/widgets/number_button_view.dart';

import 'custom_button.dart';

class CustomTransactionPinEntryField extends StatefulWidget {
  final Function(String pin) onConfirm;

  final int length;
  final bool hideWhenComplete;
  final Widget? widgetAboveButton;
  final Widget? leftOf0;
  final bool useConfirmButton;

  const CustomTransactionPinEntryField(
      {Key? key,
      required this.onConfirm,
      this.length = 4,
      this.hideWhenComplete = true,
      this.widgetAboveButton,
      this.leftOf0,
      this.useConfirmButton = true})
      : super(key: key);

  @override
  _CustomTransactionPinEntryFieldState createState() =>
      _CustomTransactionPinEntryFieldState();
}

class _CustomTransactionPinEntryFieldState
    extends State<CustomTransactionPinEntryField> {

bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      useScaffold: false,
      builder: (context, color, _) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.length,
                (index) {
                  return AnimatedContainer(
                    height: 56,
                    width: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: (code.length == widget.length &&
                              widget.hideWhenComplete)
                          ? Container(
                              height: 15,
                              width: 15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              code.length > index ? code[index] : "",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEF),
                        border: Border.all(
                          color: index == code.length - 1
                              ? const Color(0xffFFC08A)
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    duration: const Duration(milliseconds: 100),
                  );
                },
              ),
            ),
            const YBox(32),
            const Text('Resend Code',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'SfPro',
              color: Color(0xffFFAB63),
            ),),
            const SizedBox(height: 50),
            // if (code.length == widget.length)
            CustomButton(
              isLoading: isLoading,
              expanded: true,
              text: 'Confirm',
              appColor: color,
              validator: () {
               return code.length == widget.length;
              },
              onPressed: () {
                confirmCode();
              },
              radius: BorderRadius.circular(16),
              padding: const EdgeInsets.only(left: 0, right: 0),
            ),
             const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: numberButton(number: "1")),
                      Expanded(child: numberButton(number: "2")),
                      Expanded(child: numberButton(number: "3")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: numberButton(number: "4")),
                      Expanded(child: numberButton(number: "5")),
                      Expanded(child: numberButton(number: "6")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: numberButton(number: "7")),
                      Expanded(child: numberButton(number: "8")),
                      Expanded(child: numberButton(number: "9")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: widget.leftOf0 ??
                            IgnorePointer(
                              ignoring: false,
                              child: numberButton(number: "*"),
                            ),
                      ),
                      Expanded(child: numberButton(number: "0")),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (code.isNotEmpty) {
                              code = code.substring(0, code.length - 1);
                            }
                            HapticFeedback.heavyImpact();
                            setState(() {
                              clickedBack = true;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 100));
                            setState(() {
                              clickedBack = false;
                            });
                          },
                          child: AnimatedContainer(
                            width: 55,
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: clickedBack
                                  ? const Color(0xffF3F3F7)
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child:  SvgPicture.asset('images/Frame.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  bool clickedBack = false;
  String code = "";

  Widget numberButton({
    required String number,
    Color? preferredColor,
    double? preferredSize,
  }) {
    return NumberButtonView(
      number: number,
      preferredColor: preferredColor,
      preferredSize: preferredSize,
      onTap: () async {
        setState(
          () {
            if (code.length != widget.length) {
              code += number;
              if (code.length == widget.length && !widget.useConfirmButton) {
                confirmCode();
              }
            }
          },
        );
      },
    );
  }

  void confirmCode() async {
    widget.onConfirm(code);
    setState(() {
      isLoading = true;
      code = "";
    });
    await widget.onConfirm;
    setState((){
      isLoading = false;
    });
  }
}
