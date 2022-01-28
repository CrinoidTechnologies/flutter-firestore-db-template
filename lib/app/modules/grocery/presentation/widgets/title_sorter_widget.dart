import 'package:flutter/material.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/icon_helper.dart';
import 'package:grocery_template/app/ui/text_styles.dart';

class TitleSorterWidget extends StatelessWidget {
  final String title;
  final OrderBy orderBy;
  final ValueChanged<OrderBy>? callback;
  final bool isSelected;

  const TitleSorterWidget(
      {Key? key,
      required this.title,
      required this.orderBy,
      this.callback,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: isSelected
                ? AppTextStyles.bodyText2PrimaryColor
                : AppTextStyles.bodyText2BodyDarkColor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        clickableIconButton(
            orderBy.descending
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: isSelected
                ? ColorHelper.primaryColor
                : ColorHelper.dashboardCardTitleColor,
            size: 16, onPress: () {
          if (callback != null) callback!(orderBy);
        }),
      ],
    );
  }
}
