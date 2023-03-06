import 'dart:async';
import 'package:flutter/material.dart';
import 'package:superwizor/core/theme/superwizor_spacing.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pinput/pinput.dart';
import '../../core/theme/superwizor_decoration.dart';
import '../widget/superwizor_title_widget.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.mobile});
  final String? mobile;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String pinEntered = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  bool enableResend = false, enableSubmit = false;
  Duration? duration ;
  int totalSeconds = 60;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(),
            const SuperwizorTitle(),
            SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  'Enter the 4 digit code sent to your mobile number'.text
                  .textStyle(Theme.of(context).textTheme.displayMedium).maxLines(2).
                   center.make(),
                  (widget.mobile ?? '+923017371915').text.textStyle(Theme.of(context).textTheme.displaySmall).make().pOnly(top: 8),

                    Pinput(
                      length: 4,
                      onSubmitted: (String pin) {
                        pinEntered = pin;
                        enableSubmit = true;
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      defaultPinTheme: SpDecoration.defaultPinTheme(context),
                      submittedPinTheme: SpDecoration.submittedPinTheme(context),
                      followingPinTheme: SpDecoration.followingPinTheme(context),
                    ).pOnly(top: 15),

                  Visibility(
                    visible: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          child: 'Resend'.text.make(),
                          onPressed: () async {},
                        ),
                        getRemainingTime(duration?.inSeconds.remainder(60) ?? 0).text.textStyle(Theme.of(context).textTheme.labelMedium).make(),

                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: ElevatedButton(
                      child: 'Submit'.text.white.make(),
                      onPressed: () async {}
                    ),
                  ).pOnly(top: SuperwizorSpacing.spacing15),

                ],
              ),
            ).box.topRounded(value: 50).width(MediaQuery.of(context).size.width).height(230).color(Theme.of(context).colorScheme.background).make(),
          ],
        ),
      ),
    );
  }

    String getRemainingTime(int seconds) {
    if (seconds < 10) {
    return 'Resend in 00:0$seconds';
    } else {
    return 'Resend in 00:$seconds';
    }
    }

}
