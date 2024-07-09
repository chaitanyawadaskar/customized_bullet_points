import 'package:flutter/material.dart';

class Gap {
  static Widget horizontal([double width = 15]) {
    return SizedBox(
      width: width,
    );
  }

  static Widget vertical([double height = 15]) {
    return SizedBox(
      height: height,
    );
  }
}
