import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/domain/icon_service.dart';
import 'package:launcher/modules/home/domain/pie_apps_service.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:pie_menu/pie_menu.dart';

/// Envolve a tela inteira: o PieCanvas precisa ser ancestral do PieMenu para o
/// overlay renderizar em tela cheia, e o PieMenu cobre todo o conteúdo para o
/// long press no fundo abrir o menu. O AppCard cancela esse long press
/// despachando PieMenuPressNotification, mantendo o próprio long press dele.
class PieCanvasSca extends StatelessWidget {
  PieCanvasSca({super.key, required this.child});

  final Widget child;
  final HomeStore homeStore = inject<HomeStore>();
  final SettingsStore settingsStore = inject<SettingsStore>();
  final PieAppsService pieAppsService = inject<PieAppsService>();
  final IconService iconService = IconService();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return PieCanvas(
      controller: homeStore.pieController,
      theme: PieTheme(
        overlayStyle: PieOverlayStyle.around,
        longPressShowsMenu: true,
        // Com regularPressShowsMenu o menu abria em qualquer toque simples,
        // atropelando o tap dos widgets da home.
        regularPressShowsMenu: false,
        leftClickShowsMenu: false,
        childBounceEnabled: false,
        // Sem opaque o long press nas áreas vazias da home não chegava ao
        // PieMenu, porque o padrão deferToChild exige que um filho seja
        // atingido primeiro.
        hitTestBehavior: HitTestBehavior.opaque,
        overlayColor: theme.scaffoldBackgroundColor,
        pointerColor: theme.floatingActionButtonTheme.backgroundColor,
      ),
      child: Observer(
        builder: (context) {
          final List<HomeApps> apps = pieAppsService.pieApps(
            favorites: settingsStore.apps,
            defaults: homeStore.defaultPieApps,
          );

          // Sem nenhuma ação o menu abria um overlay vazio.
          if (apps.isEmpty) return child;

          return PieMenu(
            actions: apps.map((app) => _action(theme, app)).toList(),
            child: child,
          );
        },
      ),
    );
  }

  PieAction _action(ThemeData theme, HomeApps app) {
    return PieAction(
      tooltip: Text(app.name),
      semanticsLabel: app.name,
      buttonTheme: PieButtonTheme(
        backgroundColor: theme.colorScheme.surface,
        iconColor: Colors.white,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      ),
      buttonThemeHovered: PieButtonTheme(
        backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        iconColor: Colors.white,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      ),
      onSelect: () {
        final String? package = app.package;
        if (package != null) InstalledApps.startApp(package);
      },
      child: _icon(app),
    );
  }

  Widget _icon(HomeApps app) {
    if (app.image != null) {
      return Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Image.memory(app.image!, fit: BoxFit.cover),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Icon(iconService.icon(app.category), size: 12),
        Text(
          // substring(0, 3) direto lança em nomes com menos de 3 caracteres.
          app.name.length > 3 ? app.name.substring(0, 3) : app.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
