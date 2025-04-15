import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/locale/notifier/locale_notifier.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';

class LocalPickerPage extends StatelessWidget {
  const LocalPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.selectLanguage),
        leading: Center(
          child: CustomShadowButton(
            alignment: Alignment(
              context.textDirection != TextDirection.rtl ? .5 : -.5,
              0,
            ),
            onTap: () {
              context.pop();
            },
            iconSiz: 20.r,
          ),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<Locale>(
            value: const Locale('en'),
            groupValue: context.watch<LocaleCubit>().state,
            onChanged: (Locale? locale) {
              context.read<LocaleCubit>().changeLocale('en');
            },
            title: const Text('English'),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<Locale>(
            value: const Locale('ar'),
            groupValue: context.watch<LocaleCubit>().state,
            onChanged: (Locale? locale) {
              context.read<LocaleCubit>().changeLocale('ar');
            },
            title: const Text('Arabic'),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ],
      ),
    );
  }
}
