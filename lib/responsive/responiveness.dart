import 'package:flutter/cupertino.dart';

class Responsiveness {
  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
  static bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isDesktop(BuildContext context) => width(context) > 1100;
  static bool isTablet(BuildContext context) =>
      width(context) > 450 && width(context) <= 1100;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 450;
}

class CustomMediaQuery {
  static double mobileListHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .2;
  static double desktopListHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * .3;
}
