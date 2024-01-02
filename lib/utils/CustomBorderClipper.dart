

import 'package:flutter/cupertino.dart';

class TopBorderClipper extends CustomClipper<Rect> {
  final double clipHeight;

  TopBorderClipper(this.clipHeight);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, clipHeight, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class CustomClipperExample extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // Create a clipping rectangle that excludes left, right, and top borders
    return Rect.fromLTRB(35, 10, size.width - 35, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}