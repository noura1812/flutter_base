import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/locale/notifier/locale_notifier.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/core/extensions/text_style_extensions.dart';

class LocaleDropDownWidget extends StatelessWidget {
  const LocaleDropDownWidget({
    super.key,
    this.border = true,
    this.filled = false,
  });
  final bool filled;
  final bool border;
  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;

    return AlertDialog(
      title: Text(
        context.localization.selectLanguage,
        style: context.theme.textTheme.headlineSmall,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Arabic',
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color:
                          locale.languageCode == 'ar'
                              ? Theme.of(context).primaryColor
                              : null,
                    ),
                  ),
                  const Spacer(),
                  locale.languageCode == 'ar'
                      ? Icon(
                        Icons.done,
                        size: 25.h,
                        color: Theme.of(context).primaryColor,
                      )
                      : Container(),
                ],
              ),
              onTap: () {
                context.read<LocaleCubit>().changeLocale('ar');
                context.pop();
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'English',
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color:
                          locale.languageCode == 'en'
                              ? Theme.of(context).primaryColor
                              : null,
                    ),
                  ),
                  const Spacer(),
                  locale.languageCode == 'en'
                      ? Icon(
                        Icons.done,
                        size: 25.h,
                        color: Theme.of(context).primaryColor,
                      )
                      : Container(),
                ],
              ),
              onTap: () {
                context.read<LocaleCubit>().changeLocale('en');

                context.pop();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(context.localization.cancel),
        ),
      ],
    );
  }
}
