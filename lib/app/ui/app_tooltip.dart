import 'package:flutter/material.dart';

class AppToolTip extends StatelessWidget {
  final String message;
  final Widget child;

  const AppToolTip({Key? key, required this.message, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      waitDuration: Duration(milliseconds: 500),
      message: message,
      child: child,
    );
  }
}
