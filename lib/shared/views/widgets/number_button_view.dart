import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberButtonView extends StatefulWidget {
  final String number;
  final Color? preferredColor;
  final double?preferredSize;
  final VoidCallback onTap;

  const NumberButtonView(
      {Key? key,
      required this.number,
      this.preferredColor,
      this.preferredSize,
      required this.onTap})
      : super(key: key);

  @override
  _NumberButtonViewState createState() => _NumberButtonViewState();
}

class _NumberButtonViewState extends State<NumberButtonView> {
  bool clicked = false;
  bool canVibrate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onTap();
        HapticFeedback.heavyImpact();
        setState(() {
          clicked = true;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          clicked = false;
        });
      },
      child: AnimatedContainer(
        width: 55,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: clicked ? const Color(0xffF3F3F7) : Colors.white,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: Text(
            widget.number,
            style: TextStyle(
              color: widget.preferredColor ?? Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: widget.preferredSize ?? 25,
            ),
          ),
        ),
      ),
    );
  }
}
