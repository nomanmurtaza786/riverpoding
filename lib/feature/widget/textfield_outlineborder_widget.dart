import 'package:flutter/material.dart';
import 'package:superwizor/core/helper/constant.dart';

class TextFieldOutlineBorder extends StatelessWidget {
  const TextFieldOutlineBorder(
      {super.key,
      this.hintText,
      this.controller,
      this.onSaved,
      this.validator,
      this.keyboardType,
      this.text});
  final String? hintText;
  final String? text;
  final TextEditingController? controller;
  final FormFieldSetter? onSaved;
  final TextInputType? keyboardType;
  final dynamic validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      initialValue: text,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.only(left: 15),
        border: outlineBorder,
      ),
      validator: validator,
    );
  }
}
