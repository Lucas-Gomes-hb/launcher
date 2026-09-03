import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';

/// Monta a lista de apps do pie menu: os favoritos escolhidos nas
/// configurações mais os padrões fixos. Os padrões existem só aqui — não são
/// gravados em favoriteApps e não ocupam nenhum dos slots de favoritos.
class PieAppsService {
  static const List<String> defaultPackages = [
    "com.android.settings",
    "com.android.chrome",
  ];

  static bool isDefault(String? package) => defaultPackages.contains(package);

  /// Busca nome e ícone reais de cada pacote padrão no PackageManager.
  /// getAppInfo sempre carrega o ícone e não passa pelos filtros de
  /// getInstalledApps, então resolve também app de sistema. Pacote ausente é
  /// ignorado para não deixar um botão que não abre nada.
  Future<List<HomeApps>> defaults() async {
    final List<HomeApps> apps = [];

    for (final package in defaultPackages) {
      final AppInfo? info = await InstalledApps.getAppInfo(package);
      if (info == null) continue;

      apps.add(HomeApps(
        name: info.name,
        package: info.packageName,
        category: info.category.index,
        image: info.icon,
      ));
    }

    return apps;
  }

  /// Os padrões não podem ser favoritados, então não há duplicata a resolver.
  List<HomeApps> pieApps({
    required List<HomeApps> favorites,
    required List<HomeApps> defaults,
  }) => [...favorites, ...defaults];
}
