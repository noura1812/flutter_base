import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/core/common/domain/repository/preferences_repository.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/constants.dart';
import 'package:zewail/onboarding/widgets/splash_thumbnail.dart';

import '../../../../core/config/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final PreferencesRepository _preferencesRepository =
      getIt<PreferencesRepository>();
  bool _animationDone = false;

  void _navigate(bool userLoged) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if (_preferencesRepository.getValueByKey(AppConstants.boarding) != true) {
        context.goNamed(Routes.onboardingPage);
      } else {
        if (!userLoged) {
          context.go(Routes.loginOrSignupPage);
        } else {
          context.goNamed(Routes.mainLayer);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_animationDone
        // &&
        //     (context.watch<AuthCubit>().state is GetUserSuccess ||
        //         context.watch<AuthCubit>().state is GetUserFailure)
        ) {
      context.goNamed(Routes.mainLayer);

      //_navigate(context.watch<AuthCubit>().state is GetUserSuccess);
    }
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SplashThumbnail(
          onEnd: () {
            setState(() {
              _animationDone = true;
            });
          },
        ),
      ),
    );
  }
}
