import 'package:flutter/material.dart';

class Nav {
  static pushPage(Widget page, BuildContext context) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  static pushReplacementPage(
    Widget page,
    BuildContext context,
  ) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
}
