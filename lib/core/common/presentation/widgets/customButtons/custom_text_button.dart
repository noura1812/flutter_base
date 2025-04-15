import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size,
    this.fontWeight,
    this.style,
    this.enabledColor,
    this.disabledColor,
    this.decoration,
    this.decorationThickness,
    this.icon,
  });
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? enabledColor;
  final Color? disabledColor;
  final Function? onPressed;
  final TextStyle? style;
  final Widget? icon;
  final TextDecoration? decoration;
  final double? decorationThickness;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed:
          onPressed == null
              ? null
              : () {
                onPressed!();
              },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: icon ?? Container(),
          ),
          Text(
            text,
            style:
                style ??
                context.theme.textTheme.titleSmall!.copyWith(
                  color:
                      onPressed == null
                          ? disabledColor ?? Theme.of(context).disabledColor
                          : enabledColor ??
                              Theme.of(context).colorScheme.primary,
                  fontSize: size,
                  decoration: decoration,
                  decorationThickness: decorationThickness,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
