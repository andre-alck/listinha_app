import 'package:flutter/material.dart';

class AppStore {
  final theme = ValueNotifier(ThemeMode.system);
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      theme.value = mode;
      save();
    }
  }

  void save() {}
}
