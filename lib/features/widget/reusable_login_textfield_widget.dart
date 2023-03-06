import 'package:flutter/material.dart';
import 'package:superwizor/core/helper/constant.dart';


class ReUsableLoginTextField extends StatelessWidget {
  const ReUsableLoginTextField({super.key, this.hintText, this.errorText, this.keyboardType, this.text});
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: text,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        focusedBorder: outlineBorder,
        contentPadding: EdgeInsets.all(2),
        enabledBorder: outlineBorder,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
