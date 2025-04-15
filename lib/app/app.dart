import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/app/router.dart';
import 'package:zewail/core/common/presentation/locale/notifier/locale_notifier.dart';
import 'package:zewail/core/config/themes.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      enableScaleText: () => true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<LocaleCubit>()),
          ],
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                onGenerateTitle: (context) => context.localization.title,
                theme: Themes.getLightTheme(),
                locale: context.watch<LocaleCubit>().state,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router,
              );
            },
          ),
        );
      },
    );
  }
}
