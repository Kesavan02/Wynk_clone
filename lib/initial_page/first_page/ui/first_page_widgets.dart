import 'package:flutter/material.dart';

import '../../mobileno_details/ui/mobileno_details.dart';

navigationIsMobileOnPressed() {
  return MaterialPageRoute(
      builder: (context) => const Scaffold(body: MobileNoDetails()));
}

navigationIsTabletAndDesktopOnPressed(context, padding) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.3),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: const MobileNoDetails(),
        );
      });
}
