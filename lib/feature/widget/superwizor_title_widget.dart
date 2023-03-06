import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SuperwizorTitle extends StatelessWidget {
  const SuperwizorTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 'Superwizer'
        .text
        .textStyle(Theme.of(context).textTheme.titleLarge)
        .white
        .makeCentered();
  }
}
