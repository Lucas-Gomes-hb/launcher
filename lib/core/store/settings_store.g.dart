// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$wallpaperOpacityAtom = Atom(
    name: '_SettingsStoreBase.wallpaperOpacity',
    context: context,
  );

  @override
  double get wallpaperOpacity {
    _$wallpaperOpacityAtom.reportRead();
    return super.wallpaperOpacity;
  }

  @override
  set wallpaperOpacity(double value) {
    _$wallpaperOpacityAtom.reportWrite(value, super.wallpaperOpacity, () {
      super.wallpaperOpacity = value;
    });
  }

  late final _$textOverlayAtom = Atom(
    name: '_SettingsStoreBase.textOverlay',
    context: context,
  );

  @override
  bool get textOverlay {
    _$textOverlayAtom.reportRead();
    return super.textOverlay;
  }

  @override
  set textOverlay(bool value) {
    _$textOverlayAtom.reportWrite(value, super.textOverlay, () {
      super.textOverlay = value;
    });
  }

  late final _$themeAtom = Atom(
    name: '_SettingsStoreBase.theme',
    context: context,
  );

  @override
  ThemeMode get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeMode value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$appsAtom = Atom(
    name: '_SettingsStoreBase.apps',
    context: context,
  );

  @override
  ObservableList<HomeApps> get apps {
    _$appsAtom.reportRead();
    return super.apps;
  }

  @override
  set apps(ObservableList<HomeApps> value) {
    _$appsAtom.reportWrite(value, super.apps, () {
      super.apps = value;
    });
  }

  late final _$_SettingsStoreBaseActionController = ActionController(
    name: '_SettingsStoreBase',
    context: context,
  );

  @override
  void setWallpaperOpacity(double value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
      name: '_SettingsStoreBase.setWallpaperOpacity',
    );
    try {
      return super.setWallpaperOpacity(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wallpaperOpacity: ${wallpaperOpacity},
textOverlay: ${textOverlay},
theme: ${theme},
apps: ${apps}
    ''';
  }
}
