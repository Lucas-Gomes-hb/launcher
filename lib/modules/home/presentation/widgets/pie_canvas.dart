import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/domain/icon_service.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:pie_menu/pie_menu.dart';

class PieCanvasSca extends StatelessWidget{
  PieCanvasSca({super.key, required this.child});

  final Widget child;
  final HomeStore homeStore = inject<HomeStore>();
  final SettingsStore settingsStore = inject<SettingsStore>();
  final IconService iconService = IconService();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PieCanvas(
      controller: homeStore.pieController,
        theme: PieTheme(
          overlayStyle: PieOverlayStyle.around,
          longPressShowsMenu: true,
          leftClickShowsMenu: false,
          childBounceEnabled: false,
          overlayColor: theme.scaffoldBackgroundColor,
          pointerColor: theme.floatingActionButtonTheme.backgroundColor,
        ),
        onMenuToggle: (menuOpen) {
          if(settingsStore.apps.isEmpty) homeStore.pieController.closeMenu();
        },
        child: PieMenu(
          actions: [
            ...settingsStore.apps.map(((element) => 
              PieAction(
                tooltip: Text(""), 
                buttonTheme: PieButtonTheme(
                  backgroundColor: theme.colorScheme.surface, 
                  iconColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  )
                ),
                buttonThemeHovered: PieButtonTheme(
                  backgroundColor: theme.floatingActionButtonTheme.backgroundColor, 
                  iconColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  )
                ),
                onSelect: () => InstalledApps.startApp(element.package ?? ""), 
                child: element.image != null ? Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.memory(
                    element.image!, fit: BoxFit.cover,
                    )
                  ) : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Icon(
                      iconService.icon(element.category),
                      size: 12,
                    ),
                    Text(
                      element.name.substring(0,3),
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              )
            ))
          ],
          child: child
        )
    );
  }
}