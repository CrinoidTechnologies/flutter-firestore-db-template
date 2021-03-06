import 'package:flutter/material.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/app/ui/app_input_decorations.dart';
import 'package:grocery_template/app/ui/app_styles.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';
import 'package:grocery_template/app/widgets/app_title_widget.dart';

class AppTextInputWidget extends StatelessWidget {
  final String? title;
  final bool? readOnly;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;
  final TextInputType inputType;
  final String hintText;
  final String? initialValue;

  const AppTextInputWidget(
      {Key? key,
      this.title,
      this.readOnly,
      this.onChange,
      this.onTap,
      this.inputType = TextInputType.text,
      required this.hintText,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ((title ?? '').isNotEmpty) ...[
          AppTitleWidget(title: title!),
          VSpace(Insets.m)
        ],
        TextFormField(
          readOnly: readOnly ?? false,
          enabled: !(readOnly ?? false) || onTap != null,
          initialValue: initialValue,
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          decoration:
              AppInputDecorations.formInputFieldDecoration(hintText: hintText),
          style: AppTextStyles.text15NormalBluishGreyColor,
          onChanged: onChange,
          onTap: onTap,
          // onSaved: (value) => onSubmit!(value??''),
        ),
      ],
    );
  }
}
