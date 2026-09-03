import 'package:flutter/foundation.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';

class HomeRepository {
  HomeRepository({required this.hive});
  
  final HiveService hive;

  Future<List<HomeApps>> listApps() async {
    List<AppInfo> appsInstalled = await InstalledApps.getInstalledApps(
      excludeSystemApps: false,
      withIcon: true
    );

    Set<String> appsInstalledPackages = appsInstalled
        .map((e) => e.packageName)
        .toSet();

    List removed = hive.box.keys
        .where((key) => !appsInstalledPackages.contains(key))
        .toList();

    if(removed.isNotEmpty) await hive.box.deleteAll(removed);

    List<HomeApps> apps = [];
    Map<String, HomeApps> changed = {};

    for(AppInfo app in appsInstalled){
      HomeApps homeapp = HomeApps(
        name: app.name,
        package: app.packageName,
        category: app.category.index,
        image: app.icon
      );

      apps.add(homeapp);

      // Regravar os apps inalterados reescrevia todos os icones em cada
      // abertura da home, o que inchava o arquivo e disparava compactacao
      // atras de compactacao.
      if(_changed(hive.app(app.packageName), homeapp)){
        changed[app.packageName] = homeapp;
      }
    }

    if(changed.isNotEmpty) await hive.box.putAll(changed);

    return apps;
  }

  bool _changed(HomeApps? stored, HomeApps current){
    if(stored == null) return true;

    return stored.name != current.name
        || stored.package != current.package
        || stored.category != current.category
        || !listEquals(stored.image, current.image);
  }
}
