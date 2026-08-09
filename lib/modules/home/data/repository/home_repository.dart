import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';

class HomeRepository {
  HomeRepository({required this.hive});
  
  final HiveService hive;

  Future<List<HomeApps>> listApps() async {
    List<HomeApps> apps = [];

    List<AppInfo> appsInstalled = await InstalledApps.getInstalledApps(
      excludeSystemApps: false,
      withIcon: true
    );

    List<String> appsInstalledPackages = appsInstalled.map((e) => e.packageName).toList();

    for(final key in hive.box.keys.toList()){
      if(!appsInstalledPackages.contains(key)){
        hive.box.delete(key);
      }
    }
    
    for(AppInfo app in appsInstalled){
      HomeApps homeapp =HomeApps(
        name: app.name,
        package: app.packageName,
        category: app.category.index,
        image: app.icon
      );
      
      apps.add(homeapp);
      hive.box.put(app.packageName, homeapp);
    }

    return apps;
  } 
}