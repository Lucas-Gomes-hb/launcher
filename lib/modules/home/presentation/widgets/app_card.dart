import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:launcher/modules/home/domain/icon_service.dart';
import 'package:pie_menu/pie_menu.dart';

class AppCard extends StatelessWidget{
  AppCard({
    super.key,
    required this.name,
    required this.category,
    required this.showTextOverlay,
    this.package, 
    this.fnc,
    this.selected,
  });

  final String name;
  final String? package;
  final int category;
  final bool showTextOverlay;
  final VoidCallback? fnc; 
  final IconService iconService = IconService();
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    // O PieMenu que cobre a home também reconhece long press. Avisando que o
    // toque partiu do card, ele ignora o gesto e o long press daqui continua
    // abrindo o app info — o pie menu segue funcionando no resto da tela.
    return Listener(
      onPointerDown: (_) => const PieMenuPressNotification().dispatch(context),
      child: GestureDetector(
        onTap: fnc ?? (){
          log("$package");
          if(package != null) InstalledApps.startApp(package!);
        },
        onLongPress: () {
          if(package != null) InstalledApps.openSettings(package!);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 4
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4,
            children: [
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  if(showTextOverlay)Text(
                    String.fromCharCode(iconService.icon(category).codePoint),
                    style: TextStyle(
                      fontFamily: iconService.icon(category).fontFamily,
                      fontSize: 20,
                      package: iconService.icon(category).fontPackage,
                      foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    String.fromCharCode(iconService.icon(category).codePoint),
                    style: TextStyle(
                      fontSize: 20,
                      color: selected ?? false ? Theme.of(context).floatingActionButtonTheme.backgroundColor : Theme.of(context).textTheme.displayMedium!.color,
                      fontFamily: iconService.icon(category).fontFamily,
                      package: iconService.icon(category).fontPackage,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  if(showTextOverlay)Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: selected ?? false ? Theme.of(context).floatingActionButtonTheme.backgroundColor : Theme.of(context).textTheme.displayMedium!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
