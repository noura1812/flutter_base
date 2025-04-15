import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:zewail/app/di.dart';
import 'package:zewail/core/common/domain/repository/preferences_repository.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/constants.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/onboarding/models/boarding_content_model.dart';
import 'package:zewail/onboarding/widgets/boarding_tab_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final PreferencesRepository _preferencesRepository =
      getIt<PreferencesRepository>();

  @override
  void initState() {
    super.initState();
    _preferencesRepository.insertValueByKey(AppConstants.boarding, true);
  }

  List<BoardingContent> _onboardingData() => [
    BoardingContent(
      image: Image.asset(
        AppAssets.onboardingProductImage,
        fit: BoxFit.fitHeight,
        alignment: Alignment.bottomCenter,
      ),
      title: 'مستحضرات تجميل', //TODO:localization
      subtitle: 'احصل علي افضل المستحضرات',
    ),
    BoardingContent(
      image: Image.asset(
        AppAssets.onboardingProductImage,
        fit: BoxFit.fitHeight,
      ),
      title: 'مستحضرات تجميل',
      subtitle: 'احصل علي افضل المستحضرات',
    ),
  ];
  void _nextPage() {
    if (_currentPage < _onboardingData().length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the main screen or another action
      context.pushReplacementNamed(Routes.loginOrSignupPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80.w,
        leading: TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.loginOrSignupPage);
          },
          child: Text(
            context.localization.skip,
            style: CustomTextStyle.styleW500S14Black.copyWith(fontSize: 16.sp),
          ),
        ),
      ),
      body: Column(
        spacing: 20,
        children: [
          Image.asset(AppAssets.logoImage, height: 90.h, width: 70.w),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData().length,
              itemBuilder: (context, index) {
                final item = _onboardingData()[index];
                return BoardingTabContent(
                  nextPage: _nextPage,
                  item: item,
                  currentPage: _currentPage,
                  length: _onboardingData().length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
