import 'package:country_picker/country_picker.dart';
import 'package:country_picker/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:superwizor/core/helper/function.dart';
import 'package:superwizor/core/helper/validation.dart';
import 'package:superwizor/core/theme/superwizor_radius.dart';
import 'package:superwizor/core/theme/superwizor_spacing.dart';
import 'package:superwizor/features/widget/textfield_outlineborder_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/superwizor_title_widget.dart';
import 'otp_screen.dart';

String get flagEmoji => Utils.countryCodeToEmoji("AU");

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String? flag;
  String? countryCode = "61";
  TextEditingController? phoneNumber = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SuperwizorFunction.unFocus(context),
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            const Spacer(),
            const SuperwizorTitle(),
            const Spacer(),
            Column(
              children: [
                "Your Phone"
                    .text
                    .textStyle(Theme.of(context).textTheme.titleSmall)
                    .make()
                    .pOnly(top: SuperwizorSpacing.spacing25, bottom: SuperwizorSpacing.spacing12),
                'Enter your mobile number to Login or Register'
                    .text
                    .maxLines(1)
                    .overflow(TextOverflow.ellipsis)
                    .textStyle(Theme.of(context).textTheme.bodyMedium)
                    .make()
                    .pSymmetric(h: SuperwizorSpacing.spacing15),
                Form(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                flag ?? flagEmoji,
                                style: const TextStyle(fontSize: 28),
                              ),
                              const SizedBox(width: SuperwizorSpacing.spacing8),
                              "+$countryCode"
                                  .text
                                  .textStyle(
                                      Theme.of(context).textTheme.displaySmall)
                                  .make(),
                            ],
                          ),
                          onTap: () {
                            SuperwizorFunction.countryPicker(
                              context,
                              onSelect: (Country country) {
                                setState(() {
                                  flag = country.flagEmoji;
                                  countryCode = "+${country.phoneCode}";
                                });
                              },
                            );
                          },
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: TextFieldOutlineBorder(
                          keyboardType: TextInputType.phone,
                          controller: phoneNumber,
                          validator: Validation.nameValidator,
                        ),
                      ),
                    ],
                  ).p16(),
                ),
                const SizedBox(
                  height: SuperwizorSpacing.spacing12,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OtpScreen(
                      )),
                    );

                  },
                  child: "Next"
                      .text
                      .textStyle(Theme.of(context).textTheme.displayMedium)
                      .white
                      .make(),
                ),
              ],
            )
                .box
                .topRounded(value: SuperwizorRadius.cornerRadius50)
                .height(240)
                .color(Theme.of(context).cardColor)
                .make(),
          ],
        ),
      ),
    );
  }
}
