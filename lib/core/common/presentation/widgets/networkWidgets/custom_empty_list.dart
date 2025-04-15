import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleSmall!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
