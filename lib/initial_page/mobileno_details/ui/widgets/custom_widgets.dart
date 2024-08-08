import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../responsive/responiveness.dart';
import '../../../../utils.dart';

Widget mobileLastTextSpan(underlinedText) {
  return Row(
    children: [
      const Text(' and ', style: listViewText),
      InkWell(
        onTap: () {},
        child: Text(
          'Privacy Policy',
          style: underlinedText,
        ),
      )
    ],
  );
}

TextSpan desktopLastTextSpan(underlinedText) {
  return TextSpan(children: [
    const TextSpan(text: ' and ', style: listViewText),
    TextSpan(
        text: 'Privacy Policy',
        style: underlinedText,
        recognizer: TapGestureRecognizer()..onTap = () {})
  ]);
}

Widget textspan(context, underlinedText) {
  return Text.rich(TextSpan(
    children: [
      const TextSpan(
          text: 'By creating an account, you agree to the Wynk ',
          style: listViewText),
      TextSpan(
          text: 'Terms of Use',
          style: underlinedText,
          recognizer: TapGestureRecognizer()..onTap = () {}),
      (Responsiveness.isMobile(context))
          ? WidgetSpan(child: Center(child: mobileLastTextSpan(underlinedText)))
          : desktopLastTextSpan(underlinedText),
    ],
  ));
}
