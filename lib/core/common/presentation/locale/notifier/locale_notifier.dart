import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../app/di.dart';
import '../../../../../core/common/domain/repository/preferences_repository.dart';
import '../../../../../core/config/constants.dart';

@singleton
class LocaleCubit extends Cubit<Locale> {
  final PreferencesRepository _preferencesRepository;
  static const String defaultLanguageCode = 'ar';

  LocaleCubit(this._preferencesRepository) : super(_getInitialLocale());

  static Locale _getInitialLocale() {
    final PreferencesRepository preferencesRepository =
        getIt<PreferencesRepository>();
    String localeName =
        preferencesRepository.getValueByKey(AppConstants.localeKey) ??
            defaultLanguageCode;
    return Locale(localeName);
  }

  Future<void> changeLocale(String? localeName) async {
    debugPrint('xxxx->${localeName}');
    await _preferencesRepository.insertValueByKey(
        AppConstants.localeKey, localeName);
    emit(Locale(localeName ?? defaultLanguageCode));
  }
}
