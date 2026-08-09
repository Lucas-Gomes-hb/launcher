import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/modules/settings/presentation/settings_controller.dart';
import 'package:launcher/modules/settings/presentation/settings_page.dart';

class SettingsModule extends Module{
  @override
  void register(ModularContext c) {
    c.addLazySingleton(SettingsController.new);
    c.route("/settings", child: (c, r) => SettingsPage(settingsController: inject<SettingsController>()));
  }
  
}