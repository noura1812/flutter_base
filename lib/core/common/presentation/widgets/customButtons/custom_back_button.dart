import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

class CustomShadowButton extends StatelessWidget {
  const CustomShadowButton({
    super.key,
    required this.onTap,
    this.color,
    this.icon,
    this.borderColor,
    this.siz,
    this.margin,
    this.padding,
    this.alignment,
    this.iconSiz,
    this.shadowColor,
    this.label,
  });

  final void Function() onTap;
  final Color? color, borderColor;
  final Color? shadowColor;
  final String? label;
  final Widget? icon;
  final double? siz, iconSiz;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            Container(
              alignment: alignment,
              padding: padding,
              width: siz ?? 40.r,
              height: siz ?? 40.r,
              decoration: BoxDecoration(
                border:
                    borderColor != null
                        ? Border.all(color: borderColor!)
                        : null,
                borderRadius: BorderRadius.circular(12),
                color: color ?? Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor ?? Colors.black.withValues(alpha: .1),
                    blurRadius: 10.0,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child:
                  icon ??
                  Icon(
                    Icons.arrow_back_ios,
                    size: iconSiz,
                    color: Colors.black,
                  ),
            ),
            if (label != null)
              SizedBox(
                width: 60.w,
                child: Text(
                  label!,
                  style: CustomTextStyle.styleW600S14Black.copyWith(
                    color: AppColors.mainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
