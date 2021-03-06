import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_shared/extra/shared_constants.dart';
import 'package:grocery_template/app/ui/app_color_helper.dart';
import 'package:grocery_template/app/ui/app_icon_helper.dart';
import 'package:grocery_template/app/ui/app_styles.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';
import 'package:grocery_template/app/widgets/app_button_widget.dart';
import 'package:grocery_template/generated/l10n.dart';

void pickDate(
  context,
  ValueChanged<DateTime?>? callBack, {
  DateTime? initialDate,
  DateTime? minDate,
  DateTime? maxDate,
}) async {
  final validDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minDate ?? minDatePickerValidation,
      lastDate: maxDate ?? maxDatePickerValidation,
      initialEntryMode: DatePickerEntryMode.calendarOnly);
  if (callBack != null) callBack(validDate);
}

void pickTime(
  context,
  ValueChanged<DateTime?>? callBack, {
  DateTime? initialTime,
}) async {
  final validDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialTime ?? DateTime.now()));
  if (validDate != null && callBack != null) {
    callBack(DateTime.utc(
      0,
      0,
      0,
      validDate.hour,
      validDate.minute,
    ));
  }
}

///Will return null, if the pop-up is dismissed without any action
Future<bool?> showOkCancelPopUp(String title, String message) async {
  return await Get.dialog(
    GenericPopupWidget(
      title,
      message,
      onCancel: () => Get.back(result: false),
      onOk: () => Get.back(result: true),
    ),
  );
}

Future showCustomPopup(BuildContext context, Widget child,
    {bool? barrierDismissible}) {
  return showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (_, __, ___) {
        return Dialog(
          child: child,
          backgroundColor: Colors.transparent,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
      barrierDismissible: barrierDismissible ?? false,
      barrierLabel: "");
}

class GenericPopupWidget extends StatelessWidget {
  const GenericPopupWidget(this.title, this.message,
      {Key? key, this.onOk, this.onCancel})
      : super(key: key);

  final String title;
  final String message;
  final VoidCallback? onOk;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColorHelper.lightColor,
      title: Text(
        title,
        style: AppTextStyles.headline4DarkColor,
      ),
      content: Text(
        message,
        style: AppTextStyles.bodyText2BodyDarkColor,
      ),
      actionsPadding: EdgeInsets.all(Insets.m),
      actions: [
        AppButtonWidget(
          label: S.of(context).cancel,
          bgColor: AppColorHelper.participantFormBackBtnColor,
          labelColor: AppColorHelper.darkOrangeColor,
          prefix: iconWidget(
            Icons.close,
            color: AppColorHelper.darkOrangeColor,
          ),
          onTap: onCancel,
        ),
        Padding(
          padding: EdgeInsets.only(top: Insets.m),
          child: AppButtonWidget(
            label: S.of(context).ok,
            bgColor: AppColorHelper.participantFormDarkOrangeColor,
            labelColor: AppColorHelper.fixedLightColor,
            prefix: iconWidget(
              Icons.done,
              color: AppColorHelper.fixedLightColor,
            ),
            onTap: onOk,
          ),
        ),
      ],
    );
  }
}
