// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final HiveService hiveService;

  _SettingsStoreBase(this.hiveService) {
    wallpaperOpacity = hiveService.settings.get(
      "wallpaper_transparency",
      defaultValue: 1.0,
    );

    textOverlay = hiveService.settings.get(
      "textOverlay",
      defaultValue: true,
    );

    List list = hiveService.settings.get(
      "favoriteApps",
      defaultValue: <HomeApps>[],
    );

    apps = ObservableList.of(list.map((e){
      return HomeApps(category: e.category ?? "", name: e.name, package: e.package ?? "");
    }));
  }

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
    hiveService.settings.put("wallpaper_transparency", value);
  }
}