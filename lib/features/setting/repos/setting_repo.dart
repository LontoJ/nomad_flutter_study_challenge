import 'package:hive_flutter/hive_flutter.dart';

class SettingRepository {
  static const String _isDarkMode = "isDarkMode";

  final Box _box;

  SettingRepository(this._box);

  Future<void> setDarkMode(bool value) async {
    await _box.put(_isDarkMode, value);
  }

  bool isDarkMode() {
    return _box.get(_isDarkMode) ?? false;
  }
}
