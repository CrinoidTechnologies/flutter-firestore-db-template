import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';
import 'package:grocery_template/_core/utils/dialog_utils.dart';
import 'package:grocery_template/_shared/entity_crud/presentation/pages/entity_list_widget.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/modules/grocery/presentation/controllers/grocery_list_controller.dart';
import 'package:grocery_template/app/modules/grocery/presentation/widgets/create_update_grocery_widget.dart';
import 'package:grocery_template/app/modules/grocery/presentation/widgets/grocery_row_widget.dart';
import 'package:grocery_template/app/modules/grocery/presentation/widgets/title_sorter_widget.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({Key? key}) : super(key: key);

  GroceryListController get controller => Get.find<GroceryListController>();

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      EntityListWidget<GroceryEntity>(
        controller,
        (index, item) => Obx(
          () => GroceryRowWidget(
            data: controller.localList[index],
            onAction: (type) {
              if (type == "edit") {
                showCreateUpdateGroceryPopup(
                  context,
                  entity: controller.localList[index],
                  edit: true,
                );
              } else if (type == "view") {
                showCreateUpdateGroceryPopup(
                  context,
                  entity: controller.localList[index],
                  edit: false,
                );
              } else if (type == "delete") {
                onDeleteGroceryClick(controller.localList[index]);
              }
            },
          ),
        ),
        headerBuilder: () => getHeaderBar(),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(Insets.l),
          child: FloatingActionButton(
            backgroundColor: ColorHelper.primaryColor,
            onPressed: () {
              showCreateUpdateGroceryPopup(context);
            },
            child: Icon(
              Icons.add,
              color: ColorHelper.lightColor,
            ),
          ),
        ),
      )
    ]);
  }

  void showCreateUpdateGroceryPopup(BuildContext context,
      {GroceryEntity? entity, bool edit = true, bool isAddNote = false}) {
    showCustomPopup(
        context,
        CreateUpdateGroceryWidget(
          entity,
          startEditing: edit,
          isAddNote: isAddNote,
          onDelete: (v) async {
            final result = await onDeleteGroceryClick(v!);
            if (result) {
              Get.back();
            }
          },
          showEdit: true,
          showDelete: true,
        ));
  }

  Widget getHeaderBar() {
    return Obx(() {
      var columns = controller.localSorter;
      var selectedSorter = controller.selectedSorter;
      return Padding(
        padding:
            EdgeInsets.symmetric(vertical: Insets.mX, horizontal: Insets.m),
        child: Row(
          key: ValueKey(selectedSorter),
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 10,
              child: TitleSorterWidget(
                title: S.current.name,
                isSelected: columns[0].field == selectedSorter,
                orderBy: columns[0],
                callback: (value) {
                  controller.onLocalSorterUpdated(value);
                },
              ),
            ),
            Flexible(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S.current.price,
                      style: AppTextStyles.bodyText2BodyDarkColor,
                      maxLines: 1,
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
                    child: Text(S.current.expiryDate,
                        style: AppTextStyles.bodyText2BodyDarkColor,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      S.current.actions,
                      style: AppTextStyles.bodyText2BodyDarkColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  onDeleteGroceryClick(GroceryEntity v) {
    return controller.deleteOrArchiveItem(entity: v);
  }
}
