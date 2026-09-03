

import 'package:launcher/core/storage/hive_service.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/data/repository/home_repository.dart';
import 'package:launcher/modules/home/domain/pie_apps_service.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:mobx/mobx.dart';

class HomeController {
  HomeController({
    required this.homeRepository,
    required this.homeStore,
    required this.hiveService,
    required this.pieAppsService,
  });

  final PieAppsService pieAppsService;
  final HomeRepository homeRepository;
  final HomeStore homeStore;
  final HiveService hiveService;

  void apps() async {
    Future<List<HomeApps>> defaults = pieAppsService.defaults();

    var apps = await homeRepository.listApps();
    homeStore.apps = ObservableList.of(sort(list:apps));

    homeStore.defaultPieApps = ObservableList.of(await defaults);
  }

  void search({required bool close}){
    homeStore.searchActive = !homeStore.searchActive;
    homeStore.term = '';
    if(close){
      List<HomeApps> appsHive = hiveService.box.values.cast<HomeApps>().toList();
      homeStore.apps = ObservableList.of(sort(list: appsHive));
      apps();
    }
  }

  void sortBySearch(){
    List<HomeApps> filterList = [];
    List<HomeApps> apps = hiveService.box.values.cast<HomeApps>().toList();
    for(HomeApps app in apps){
      if(app.name.toLowerCase().trim().contains(homeStore.term.toLowerCase().trim())){
        filterList.add(app);
      }
    }
    homeStore.apps = ObservableList.of(sort(list: filterList));
  }

  List<HomeApps> sort({required List<HomeApps> list}){
    list.sort((a,b) => a.name.toUpperCase().compareTo(b.name.toUpperCase()));
    return list;
  }
}