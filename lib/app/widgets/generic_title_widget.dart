import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/text_styles.dart';

class GenericTitleWidget extends StatelessWidget {
  final String title;

  const GenericTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.text15MediumDarkColor,
    );
  }
}
