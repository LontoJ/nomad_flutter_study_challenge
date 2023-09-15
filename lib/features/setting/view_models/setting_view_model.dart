import 'package:challenge_day16/features/setting/models/setting_model.dart';
import 'package:challenge_day16/features/setting/repos/setting_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingViewModel extends Notifier<SettingModel> {
  final SettingRepository _repository;

  SettingViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = SettingModel(
      isDarkMode: value,
    );
  }

  @override
  SettingModel build() {
    return SettingModel(
      isDarkMode: _repository.isDarkMode(),
    );
  }
}

final settingProvider = NotifierProvider<SettingViewModel, SettingModel>(
  () => throw UnimplementedError(),
);
