import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/_shared/utils/date_utils.dart';
import 'package:grocery_template/_shared/utils/dialog_utils.dart';
import 'package:grocery_template/_shared/utils/toast_util.dart';
import 'package:grocery_template/app/di/dependency_injection.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/modules/grocery/domain/usecases/create_update_grocery_use_case.dart';
import 'package:grocery_template/app/ui/app_decorations.dart';
import 'package:grocery_template/app/ui/app_color_helper.dart';
import 'package:grocery_template/app/ui/app_icon_helper.dart';
import 'package:grocery_template/app/ui/app_styles.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class CreateUpdateGroceryWidget extends StatefulWidget {
  final GroceryEntity? data;
  final bool startEditing;
  final bool isAddNote;
  final bool showEdit;
  final bool showDelete;

  const CreateUpdateGroceryWidget(this.data,
      {Key? key,
      this.onSave,
      this.onDelete,
      this.startEditing = true,
      this.isAddNote = false,
      required this.showEdit,
      required this.showDelete})
      : super(key: key);

  @override
  _CreateUpdateGroceryWidgetState createState() =>
      _CreateUpdateGroceryWidgetState();
  final ValueChanged<GroceryEntity?>? onSave;
  final ValueChanged<GroceryEntity?>? onDelete;
}

class _CreateUpdateGroceryWidgetState extends State<CreateUpdateGroceryWidget> {
  bool isEditMode = false;
  bool processing = false;
  late GroceryEntity entity;
  bool showDeleteButton = false;

  bool get showEdit => widget.showEdit;

  @override
  void initState() {
    super.initState();

    showDeleteButton = widget.data != null && widget.showDelete;

    if (widget.data != null) {
      entity = widget.data!;
    } else {
      entity = GroceryEntity.empty('');
    }
    isEditMode = widget.startEditing;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(vertical: Insets.l, horizontal: Insets.xl),
          decoration: AppDecorations.lightR30BgDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTopBar(),
              VSpace(Insets.l),
              TextFormField(
                initialValue: entity.title,
                readOnly: !isEditMode,
                onChanged: (v) => entity.title = v,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: S.of(context).enterTitle,
                    hintStyle: AppTextStyles.headline5Style(context,
                        color: AppColorHelper.bodyLightColor),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: AppTextStyles.headline5Style(context,
                    color: AppColorHelper.headingColor),
                cursorColor: AppColorHelper.participantFormDarkOrangeColor,
              ),
              VSpace(Insets.m),
              TextFormField(
                readOnly: !isEditMode,
                initialValue:
                    (entity.price ?? 0) != 0 ? entity.price.toString() : null,
                onChanged: (v) {
                  entity.price = double.tryParse(v) ?? 0.0;
                },
                decoration: InputDecoration(
                    hintText: S.of(context).enterPrice,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: AppTextStyles.bodyText1DarkColor,
                cursorColor: AppColorHelper.participantFormDarkOrangeColor,
                keyboardType: TextInputType.number,
              ),
              VSpace(Insets.m),
              Text(
                S.of(context).chooseExpirationDate,
                style: AppTextStyles.body12MediumGreyWeakColor,
              ),
              VSpace(Insets.m),
              Row(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        iconWidget(Icons.calendar_today_outlined,
                            color: AppColorHelper.bodyDarkColor),
                        HSpace(Insets.m),
                        Text(
                          entity.expiryDate?.serverToGeneralDisplayDate ??
                              'DD/MM/YYYY',
                          style: AppTextStyles.bodyRegular14HeadingColor,
                        )
                      ],
                    ),
                    onTap: () {
                      if (isEditMode) {
                        pickDate(context, (v) {
                          if (v != null) {
                            entity.expiryDate = v.serverDate;
                            setState(() {});
                          }
                        },
                            initialDate: (entity.expiryDate ?? "").isNotEmpty
                                ? entity.expiryDate.toString().asServerDate
                                : null);
                      }
                    },
                  ),
                ],
              ),
              VSpace(Insets.l),
              SizedBox(
                height: 100,
                child: TextFormField(
                  readOnly: !isEditMode,
                  initialValue: entity.description ?? '',
                  onChanged: (v) => entity.description = v,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      hintText: S.of(context).enterDetails,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: AppTextStyles.bodyText1DarkColor,
                  cursorColor: AppColorHelper.participantFormDarkOrangeColor,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (showEdit)
              InkWell(
                child: isEditMode
                    ? (processing
                        ? const CircularProgressIndicator()
                        : getButton(isSave: true))
                    : iconWidget(
                        Icons.edit_outlined,
                        color: AppColorHelper.darkColor,
                      ),
                onTap: () {
                  if (isEditMode) {
                    if (validPageData()) {
                      createUpdateGrocery(context, (v) {
                        if (v) {
                          if (widget.onSave != null) widget.onSave!(entity);
                          Navigator.of(context).pop();
                        }
                      });
                      return;
                    }
                  }
                  if (isEditMode && !validPageData()) return;
                  setState(() {
                    isEditMode = !isEditMode;
                  });
                },
              ),
            if (showDeleteButton)
              Row(
                children: [
                  HSpace(Insets.l),
                  clickableIcon(
                    Icons.delete_outline_rounded,
                    color: AppColorHelper.darkColor,
                    onPress: () {
                      if (widget.onDelete != null) widget.onDelete!(entity);
                    },
                  )
                ],
              ),
            HSpace(Insets.l),
            InkWell(
              child: getButton(),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ))
      ],
    );
  }

  bool validPageData() {
    final error = Rx<Failure?>(null);
    if (entity.title.isEmpty) {
      error.value = Failure(message: S.of(context).pleaseInputValidTitle);
    } else if ((entity.description ?? '').isEmpty) {
      error.value = Failure(message: S.of(context).pleaseInputValidDescription);
    } else if ((entity.price ?? 0) == 0) {
      error.value = Failure(message: S.of(context).pleaseEnterPrice);
    } else if ((entity.expiryDate ?? '').isEmpty) {
      error.value = Failure(message: S.of(context).pleaseEnterExpirationDate);
    }
    if (error.value != null) {
      showToast(error.value!);
      return false;
    }
    return true;
  }

  Widget getButton({bool isSave = false}) {
    return Container(
      decoration: AppDecorations.borderGreyR16BgDecoration,
      child: Padding(
          padding: EdgeInsets.all(Insets.m),
          child: iconWidget(
            isSave ? Icons.check : Icons.close,
            color: AppColorHelper.darkColor,
          )),
    );
  }

  void createUpdateGrocery(context, ValueChanged<bool> callBack) async {
    setState(() {
      processing = true;
    });
    var result = await appSL<CreateUpdateGroceryUseCase>()(entity);
    result.fold((l) {
      callBack(false);
      showMessage(l);
    }, (r) {
      callBack(true);
      showMessage(Success(message: S.of(context).success));
    });
    setState(() {
      processing = false;
    });
  }
}
