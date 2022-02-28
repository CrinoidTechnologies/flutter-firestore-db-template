import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/app_color_helper.dart';
import 'package:grocery_template/app/ui/app_icon_helper.dart';
import 'package:grocery_template/app/ui/app_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class ActionButtonsWidget extends StatelessWidget {
  final ValueChanged<String> onAction;
  final bool showDeleteOption;
  final bool showEditOption;

  const ActionButtonsWidget(
      {Key? key,
      required this.onAction,
      this.showEditOption = true,
      this.showDeleteOption = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        clickableToolTipIcon(
          Icons.remove_red_eye_outlined,
          size: IconSizes.s,
          color: AppColorHelper.rowActionIconColor,
          onPress: () => onAction('view'),
          padding: EdgeInsets.symmetric(vertical: Insets.xs),
          toolTip: S.of(context).view,
        ),
        if (showEditOption)
          clickableToolTipIcon(Icons.edit,
              size: IconSizes.s,
              color: AppColorHelper.rowActionIconColor,
              padding: EdgeInsets.only(
                  top: Insets.sX, bottom: Insets.sX, left: Insets.m),
              onPress: () => onAction('edit'),
              toolTip: S.of(context).edit),
        if (showDeleteOption)
          clickableToolTipIcon(
            Icons.delete,
            size: IconSizes.s,
            color: AppColorHelper.rowActionIconColor,
            onPress: () => onAction('delete'),
            padding: EdgeInsets.only(
                top: Insets.sX, bottom: Insets.sX, left: Insets.m),
            toolTip: S.of(context).delete,
          ),
      ],
    );
  }
}
