import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';

class AppButtonWidget extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? labelColor;
  final Widget? suffix;
  final Widget? prefix;
  final VoidCallback? onTap;
  final ValueChanged<TapDownDetails>? onTapDown;
  final double? borderRadius;
  final bool shrink;
  final EdgeInsetsGeometry? padding;

  const AppButtonWidget(
      {Key? key,
      required this.label,
      this.bgColor,
      this.labelColor,
      this.suffix,
      this.prefix,
      this.borderRadius,
      this.onTap,
      this.shrink = false,
      this.onTapDown,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onTapDown: onTapDown,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? ColorHelper.darkOrangeColor,
          borderRadius:
              BorderRadius.all(Radius.circular(borderRadius ?? Corners.s4)),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Insets.mX, vertical: Insets.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
            children: [
              if (prefix != null) prefix!,
              Padding(
                padding: padding ?? const EdgeInsets.all(0.0),
                child: Text(
                  label,
                  style: AppTextStyles.bodyText2Style(context,
                      color: labelColor ?? ColorHelper.fixedLightColor),
                  textAlign: TextAlign.center,
                ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}
