import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_shared/entity/savable_entity.dart';
import 'package:grocery_template/_shared/entity_crud/presentation/controllers/base_list_controller.dart';
import 'package:grocery_template/_shared/ui/components/loading_widget.dart';
import 'package:grocery_template/app/ui/bg_decoration.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/icon_helper.dart';
import 'package:grocery_template/app/ui/input_decorations.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';
import 'package:grocery_template/app/widgets/genric_button_widget.dart';
import 'package:grocery_template/generated/l10n.dart';

typedef RowBuilder<S extends Widget, T extends SavableEntity> = S Function(
    int position, T item);
typedef HeaderBuilder<S extends Widget> = S Function();

class EntityListWidget<T extends SavableEntity> extends StatelessWidget {
  final BaseListController<T> controller;
  final RowBuilder<Widget, T> rowBuilder;
  final HeaderBuilder? headerBuilder;
  final bool showSearchAndFilter;

  const EntityListWidget(
    this.controller,
    this.rowBuilder, {
    this.headerBuilder,
    this.showSearchAndFilter = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Corners.s30Border,
      child: Container(
        padding: EdgeInsets.only(top: Insets  .xl, bottom: Insets.mX),
        child: Column(
          children: [
            if (showSearchAndFilter) ...[
              getSearchAndFilterBar(context),
              Container(
                margin: EdgeInsets.only(top: Insets.mX),
                height: 0.5,
                width: double.infinity,
                color: ColorHelper.paginationItemBorderColor,
              ),
            ],
            if (headerBuilder != null) ...[
              headerBuilder!(),
              Container(
                height: 0.5,
                width: double.infinity,
                color: ColorHelper.paginationItemBorderColor,
              )
            ],
            Expanded(
              child: Obx(() {
                var length = controller.localList.length + 1;
                return ListView.builder(
                    itemBuilder: (_, position) {
                      if (position == length - 1) {
                        return (controller.itemsFetchedToLimit &&
                                controller.isFetching.isFalse)
                            ? GenericButtonWidget(
                                label: /*S.of(context).loadNextCountItems(
                                    controller.limitPerFetch.value)*/
                                    'Load next items',
                                onTap: controller.fetchMoreItems,
                              )
                            : controller.isFetching.isTrue
                                ? LoadingWidget()
                                : Container();
                      }
                      return rowBuilder(
                          position, controller.localList[position]);
                    },
                    itemCount: length);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget getSearchAndFilterBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.l),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              //style: AppTextStyles.text15NormalBluishGreyColor,
              initialValue: controller.searchQuery.value,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: AppInputDecorations.formInputFieldDecoration(
                  prefixIcon: iconWidget(
                    Icons.search,
                    color: ColorHelper.dashboardCardTitleColor,
                  ),
                  hintText: S.of(context).search),
            ),
          ),
        ],
      ),
    );
  }
}
