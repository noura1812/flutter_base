import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';

class Themes {
  static const fontFamily = 'Montserrat';

  static ThemeData getLightTheme() => ThemeData(
    dividerTheme: const DividerThemeData(color: AppColors.black),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.mainColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 60.h,
      titleTextStyle: CustomTextStyle.styleW600S24Black.copyWith(
        fontSize: 20.sp,
        color: AppColors.mainColor,
      ),
      centerTitle: true,
      elevation: 0.h,
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.mainColor, size: 24.h),
    ),
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.lightGray,
      selectedIconTheme: IconThemeData(size: 25.r, color: AppColors.mainColor),
      unselectedIconTheme: IconThemeData(size: 25.r, color: Colors.black),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: CustomTextStyle.styleW400S16black.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.mainColor,
      ),
      unselectedLabelStyle: CustomTextStyle.styleW400S16black.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 10.sp,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: Colors.black,
    ),
  );
}
