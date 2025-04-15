import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/onboarding/models/boarding_content_model.dart';

class BoardingTabContent extends StatelessWidget {
  const BoardingTabContent({
    super.key,
    required this.item,
    required this.currentPage,
    required this.length,
    required this.nextPage,
  });
  final BoardingContent item;
  final int currentPage;
  final int length;
  final void Function() nextPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r, left: 20.r, right: 20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          item.image,
          SizedBox(
            width: 250.w,
            child: Column(
              spacing: 10,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.styleW600S24Black.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  item.subtitle,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.styleW600S18Black.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),

          // SizedBox(
          //   height: 20.h,
          // ),
          CustomMainButton(
            onPressed: nextPage,
            text:
                currentPage == length - 1
                    ? context.localization.skip
                    : context.localization.next,
            height: 55.h,
          ),
        ],
      ),
    );
  }
}
