import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton({
    super.key,
    this.child,
    this.onPressed,
    this.width,
    this.text,
    this.textPadding,
    this.enabledColor,
    this.borderRadius = 10,
    this.disabledBackgroundColor,
    this.margin,
    this.height,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.isOutlined = false,
  });

  final void Function()? onPressed;
  final Widget? child;
  final double borderRadius;
  final double? fontSize;
  final String? text;
  final EdgeInsetsGeometry? textPadding;
  final EdgeInsetsGeometry? margin;
  final double? width, height;
  final Color? enabledColor, textColor, disabledBackgroundColor, borderColor;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: isOutlined ? 0 : null,
          padding: textPadding,
          textStyle: TextStyle(
            color: isOutlined ? enabledColor : Colors.white,
            fontSize: fontSize ?? 18.sp,
            fontWeight: FontWeight.w600,
          ),
          disabledBackgroundColor:
              disabledBackgroundColor ?? Theme.of(context).disabledColor,
          fixedSize: Size(250.w, 60.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side:
                isOutlined
                    ? BorderSide(
                      color:
                          borderColor ?? (enabledColor ?? AppColors.mainColor),
                      width: 1,
                    )
                    : borderColor == null
                    ? BorderSide.none
                    : BorderSide(color: borderColor!, width: 1),
          ),
          backgroundColor:
              isOutlined
                  ? (enabledColor ?? Colors.white)
                  : (enabledColor ?? AppColors.mainColor),
        ),
        onPressed:
            onPressed == null
                ? null
                : () {
                  onPressed!();
                },
        child:
            child ??
            Text(
              text ?? '',
              style: CustomTextStyle.styleW400S16black.copyWith(
                color:
                    textColor ??
                    (isOutlined
                        ? (enabledColor ?? AppColors.mainColor)
                        : Colors.white),
                fontSize: fontSize ?? 20.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
