import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/presentation/home_module.dart';
import 'package:launcher/modules/settings/presentation/settings_module.dart';

class AppModule extends Module {
  final HiveService hiveService;
  AppModule(this.hiveService);

  @override
  void register(ModularContext c) {
    c.addInstance<HiveService>(hiveService);
    c.addLazySingleton(SettingsStore.new);
    c.module(HomeModule());
    c.module(SettingsModule());
  }
}