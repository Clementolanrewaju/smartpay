import 'package:flutter/material.dart';

// constant values
const double padding = 15.0;
const double hPadding = 15.0;
const double vPadding = 20.0;

extension DimsExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
  double deviceWidth([double extent = 1]) => mediaQuerySize.width * extent;
  double deviceHeight([double extent = 1]) => mediaQuerySize.height * extent;
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;
  bool get isLandscape => deviceOrientation == Orientation.landscape;
  bool get isPortrait => deviceOrientation == Orientation.portrait;
}

class SmartDims {
  const SmartDims._();
}

class XBox extends StatelessWidget {
  const XBox(this._width);

  final double _width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}

class YBox extends StatelessWidget {
  const YBox(this._height);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}
