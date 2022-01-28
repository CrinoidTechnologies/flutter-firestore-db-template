import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  const ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    ));
  }
}
