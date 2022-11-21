import 'package:flutter/material.dart';

class TextWidget extends Text {
  TextWidget(
    super.data, {
    Key? key,
    double size = 16,
  }) : super(
          key: key,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        );
}
