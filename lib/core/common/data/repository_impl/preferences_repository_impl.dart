import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repository/preferences_repository.dart';

@Injectable(as: PreferencesRepository)
class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences sharedPreferences;

  PreferencesRepositoryImpl(this.sharedPreferences);

  @override
  T? getValueByKey<T>(String key) {
    return sharedPreferences.get(key) as T?;
  }

  @override
  Future<void> insertValueByKey(String key, dynamic value) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
  }

  @override
  Future<void> removeValueByKey(String key) async {
    sharedPreferences.remove(key);
  }
}
