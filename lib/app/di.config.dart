// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/common/data/repository_impl/preferences_repository_impl.dart'
    as _i497;
import '../core/common/domain/repository/preferences_repository.dart' as _i553;
import '../core/common/presentation/locale/notifier/locale_notifier.dart'
    as _i801;
import '../core/helpers/dialog_helper.dart' as _i613;
import '../core/network/interceptors/custom_interceptor.dart' as _i578;
import '../core/network/interceptors/mock_interceptor.dart' as _i363;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i363.MockInterceptor>(() => _i363.MockInterceptor());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i613.DialogManager>(() => _i613.DialogManager());
    gh.factory<_i553.PreferencesRepository>(
        () => _i497.PreferencesRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i801.LocaleCubit>(
        () => _i801.LocaleCubit(gh<_i553.PreferencesRepository>()));
    gh.factory<_i578.CustomInterceptor>(
        () => _i578.CustomInterceptor(gh<_i553.PreferencesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
