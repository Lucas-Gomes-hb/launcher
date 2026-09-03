// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/domain/pie_apps_service.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

/// Quantidade de slots de favoritos exibida na tela de configurações.
const int maxFavoriteApps = 6;

abstract class _SettingsStoreBase with Store {
  _SettingsStoreBase(this.hiveService) {
    wallpaperOpacity = hiveService.setting(
      SettingsKeys.wallpaperTransparency,
      1.0,
    );

    textOverlay = hiveService.setting(SettingsKeys.textOverlay, true);

    theme = ThemeMode.values.firstWhere(
      (mode) => mode.name == hiveService.setting(SettingsKeys.themeMode, ""),
      orElse: () => ThemeMode.light,
    );

    // Um padrão gravado por uma versão anterior devolve o slot ao usuário.
    apps = ObservableList.of(
      hiveService.favoriteApps().where(
        (app) => !PieAppsService.isDefault(app.package),
      ),
    );
  }

  final HiveService hiveService;

  @observable
  double wallpaperOpacity = 1.0;

  @observable
  bool textOverlay = true;

  @observable
  ThemeMode theme = ThemeMode.light;

  @observable
  ObservableList<HomeApps> apps = ObservableList();

  @action
  void setWallpaperOpacity(double value) {
    wallpaperOpacity = value;
    hiveService.saveSetting(SettingsKeys.wallpaperTransparency, value);
  }

  @action
  void setTextOverlay(bool value) {
    textOverlay = value;
    hiveService.saveSetting(SettingsKeys.textOverlay, value);
  }

  @action
  void setTheme(ThemeMode value) {
    theme = value;
    hiveService.saveSetting(SettingsKeys.themeMode, value.name);
  }

  /// Grava o app no slot [index]. O índice é validado porque um insert fora do
  /// tamanho atual da lista lança RangeError e o favorito era perdido.
  @action
  void setFavApp(int index, HomeApps app) {
    if (index < 0 || index >= maxFavoriteApps) return;

    // Settings e Chrome já ficam fixos no pie menu e não gastam slot.
    if (PieAppsService.isDefault(app.package)) return;

    final favorites = apps.toList()
      ..removeWhere((favorite) => favorite.package == app.package);

    if (index < favorites.length) {
      favorites[index] = app;
    } else {
      favorites.add(app);
    }

    apps = ObservableList.of(favorites);
    hiveService.saveFavoriteApps(favorites);
  }

  @action
  void removeFavApp(int index) {
    if (index < 0 || index >= apps.length) return;

    final favorites = apps.toList()..removeAt(index);

    apps = ObservableList.of(favorites);
    hiveService.saveFavoriteApps(favorites);
  }
}
