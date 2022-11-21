import 'package:flutter/material.dart';

class TextFieldWidget extends TextFormField {
  TextFieldWidget({
    Key? key,
    required String hintText,
    required TextEditingController controller,
  }) : super(
          key: key,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill the field';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            counterText: '',
          ),
          maxLength: 20,
        );
}
