import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:superwizor/core/theme/superwizor_color.dart';
import 'superwizor_color.dart';

abstract class SpDecoration {



  static PinTheme followingPinTheme(BuildContext context) => PinTheme(
    width: 56,
    height: 56,
    textStyle: Theme.of(context).textTheme.displaySmall,
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static PinTheme defaultPinTheme(BuildContext context) =>  followingPinTheme(context).copyWith(
    decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color:  Theme.of(context).colorScheme.onPrimary),
        ),
  );
  
  static PinTheme submittedPinTheme(BuildContext context) => followingPinTheme(context).copyWith(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color:  Theme.of(context).colorScheme.primary),
    ),
  );

}