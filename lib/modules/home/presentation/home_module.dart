import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/battery_store.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/data/repository/home_repository.dart';
import 'package:launcher/modules/home/domain/pie_apps_service.dart';
import 'package:launcher/modules/home/presentation/home_controller.dart';
import 'package:launcher/modules/home/presentation/home_page.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';

class HomeModule extends Module {
  @override
  void register(ModularContext c) {
    c.addLazySingleton(HomeStore.new);
    c.addLazySingleton(BatteryStore.new);
    c.addLazySingleton(HomeRepository.new);
    c.addLazySingleton(PieAppsService.new);
    c.addLazySingleton(HomeController.new);

    c.route("/home", child: (context, r) => HomePage(
      homeStore: inject<HomeStore>(),
      homeController: inject<HomeController>(),
      settingsStore: inject<SettingsStore>(),
    ));
  }

}