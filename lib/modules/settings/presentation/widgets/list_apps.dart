import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:launcher/modules/home/presentation/widgets/app_card.dart';
import 'package:launcher/modules/settings/presentation/settings_controller.dart';

class ListApps extends StatelessWidget{
  ListApps({super.key, required this.function});

  final HomeStore homeStore = inject<HomeStore>();
  final SettingsController settingsController = inject<SettingsController>();
  final void Function(HomeApps app) function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          child: Text(
            "Escolha o app",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: homeStore.apps.map((v)=>GestureDetector(
              child: Row(
                children: [
                  AppCard(
                    name: v.name, 
                    fnc:() => function(v),
                    package: v.package, 
                    category: v.category,
                    showTextOverlay: false,
                    selected: settingsController.settingsStore.apps.map((e) => e.package).contains(v.package),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }

}