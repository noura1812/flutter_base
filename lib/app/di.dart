import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/client.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

// ignore: invalid_annotation_target
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Dio get dio => NetworkClient.getDio(getIt(), getIt());
}

Future<void> configureDependencies() async => getIt.init();
