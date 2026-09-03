import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:launcher/hive_registrar.g.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:path_provider/path_provider.dart';

/// Chaves gravadas na box de configurações.
class SettingsKeys {
  static const String wallpaperTransparency = "wallpaper_transparency";
  static const String textOverlay = "textOverlay";
  static const String themeMode = "themeMode";
  static const String favoriteApps = "favoriteApps";
}

class HiveService {
  static const String appsBoxName = "apps";
  static const String settingsBoxName = "settings";

  late Box box;
  late Box settings;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Sem a guarda o Hive lança se init() rodar duas vezes (hot restart).
    if (!Hive.isAdapterRegistered(HomeAppsAdapter().typeId)) {
      Hive.registerAdapters();
    }

    box = await _openBox(appsBoxName);
    settings = await _openBox(settingsBoxName);
  }

  /// Abre uma box isoladamente. Se o arquivo estiver corrompido além do que o
  /// crash recovery do Hive resolve, recria somente essa box, mantendo as
  /// outras intactas — os apps favoritos ficam na box de configurações e não
  /// podem ser perdidos por causa de uma falha na box de apps.
  Future<Box> _openBox(String name) async {
    if (Hive.isBoxOpen(name)) return Hive.box(name);

    try {
      return await Hive.openBox(name);
    } catch (e) {
      debugPrint('Erro ao abrir a box "$name", recriando apenas ela: $e');
      await Hive.deleteBoxFromDisk(name);
      return await Hive.openBox(name);
    }
  }

  /// Lê uma configuração garantindo o tipo esperado. Um valor gravado por uma
  /// versão anterior do app pode ter outro tipo, e o cast direto derrubaria a
  /// inicialização.
  T setting<T>(String key, T fallback) {
    final value = settings.get(key);
    return value is T ? value : fallback;
  }

  Future<void> saveSetting(String key, Object? value) =>
      settings.put(key, value);

  /// Entradas inválidas são descartadas em vez de derrubar a leitura.
  List<HomeApps> favoriteApps() {
    final stored = settings.get(SettingsKeys.favoriteApps);
    if (stored is! List) return <HomeApps>[];
    return stored.whereType<HomeApps>().toList();
  }

  Future<void> saveFavoriteApps(List<HomeApps> apps) =>
      settings.put(SettingsKeys.favoriteApps, apps);

  HomeApps? app(String package) {
    final stored = box.get(package);
    return stored is HomeApps ? stored : null;
  }

  /// O Hive compacta sozinho conforme a compactionStrategy padrão. Este método
  /// existe para forçar a compactação quando necessário.
  Future<void> compactBoxes() async {
    for (final name in [appsBoxName, settingsBoxName]) {
      try {
        if (Hive.isBoxOpen(name)) await Hive.box(name).compact();
      } catch (e) {
        debugPrint('Erro ao compactar a box "$name": $e');
      }
    }
  }

  Future<void> close() async {
    try {
      await Hive.close();
    } catch (e) {
      debugPrint('Erro ao fechar as boxes: $e');
    }
  }

  /// Apaga apenas as boxes do app e as reabre vazias.
  Future<void> resetAll() async {
    await close();
    await Hive.deleteBoxFromDisk(appsBoxName);
    await Hive.deleteBoxFromDisk(settingsBoxName);
    box = await _openBox(appsBoxName);
    settings = await _openBox(settingsBoxName);
  }
}
