import 'package:flutter/material.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorHelper.accentColor),
      ),
    );
  }
}

class LoadingWithTextWidget extends StatelessWidget {
  final String text;

  const LoadingWithTextWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorHelper.accentColor),
          ),
          VSpace(Insets.s),
          Text(text)
        ],
      ),
    );
  }
}
