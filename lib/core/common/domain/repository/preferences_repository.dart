abstract class PreferencesRepository {
  T? getValueByKey<T>(String key);
  Future<void> insertValueByKey(String key, dynamic value);
  Future<void> removeValueByKey(String key);
}
