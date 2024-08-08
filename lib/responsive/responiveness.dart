import 'package:flutter/cupertino.dart';

class Responsiveness {
  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
  static bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
}

class CustomMediaQuery {
  static double mobileListHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .2;
  static double desktopListHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .3;
}
