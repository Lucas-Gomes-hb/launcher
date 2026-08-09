import 'package:hive_ce/hive.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  late Box box;
  late Box settings;

  Future<void> init() async {
    final path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    Hive.registerAdapter(HomeAppsAdapter());
    box = await Hive.openBox("apps");
    settings = await Hive.openBox("settings");

    if (!settings.containsKey("wallpaper_transparency")) {
      settings.put("wallpaper_transparency", 1.0);
    }
    if (!settings.containsKey("themeSystem")) {
      settings.put("themeSystem", true);
    }
    if (!settings.containsKey("textOverlay")) {
      settings.put("textOverlay", true);
    }
    if (!settings.containsKey("favoriteApps")) {
      settings.put("favoriteApps", <HomeApps>[]);
    }
  }
}