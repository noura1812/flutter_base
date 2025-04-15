import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.refresh,
  });
  final Failure error;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error.message == null || error.message!.trim().isEmpty
                ? context.localization.errorResponse('somethingWentWrong')
                : error.message!,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          FilledButton(
            onPressed: () {
              refresh();
            },
            child: Text(
              'tryAgain',
              style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
