import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';
import 'action_buttons_widget.dart';
import 'package:grocery_template/_shared/utils/date_utils.dart';

class GroceryRowWidget extends StatelessWidget {
  final GroceryEntity data;
  final ValueChanged<String> onAction;

  const GroceryRowWidget({Key? key, required this.data, required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Insets.mX, horizontal: Insets.mX),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 8,
                child: Row(
                  children: [
                    Text(
                      data.title,
                      style: AppTextStyles.captionBodyDarkColor(context),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${data.price} Rs/Item',
                        style: AppTextStyles.bodyText2BodyDarkColor,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: Insets.s),
                          child: Text(
                            data.expiryDate?.serverToGeneralDisplayDate ?? '',
                            style:
                                AppTextStyles.captionBodyDarkColor(context),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  )),
              Flexible(
                flex: 8,
                child: ActionButtonsWidget(
                  onAction: onAction,
                  showDeleteOption: true,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          width: double.infinity,
          color: ColorHelper.paginationItemBorderColor,
        ),
      ],
    );
  }
}
