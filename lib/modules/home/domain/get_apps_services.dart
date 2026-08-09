import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/data/repository/home_repository.dart';

class GetAppsServices {
  GetAppsServices({required this.homeRepository});

  final HomeRepository homeRepository;

  Future<List<HomeApps>> getApps() async {
    return homeRepository.listApps();
  }
}