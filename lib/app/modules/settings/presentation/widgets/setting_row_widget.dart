import 'package:flutter/cupertino.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/widgets/generic_title_widget.dart';

class SettingRowWidget extends StatelessWidget {
  final String title;
  final Widget suffix;

  const SettingRowWidget({Key? key, required this.title, required this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [GenericTitleWidget(title: title), suffix],
        ),
        VSpace(Insets.sX),
        Container(
          height: 0.5,
          width: double.infinity,
          color: ColorHelper.paginationItemBorderColor,
        ),
      ],
    );
  }
}
