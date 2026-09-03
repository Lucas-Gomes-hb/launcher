import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:launcher/modules/home/presentation/widgets/app_card.dart';

class HomeList extends StatelessWidget{
  HomeList({super.key});

  final HomeStore homeStore = inject<HomeStore>();
  final SettingsStore settingsStore = inject<SettingsStore>();

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Observer(
              builder: (c) => ListView.builder(
                shrinkWrap: true,
                itemCount: homeStore.apps.length,
                itemBuilder: (c,i){
                  HomeApps app = homeStore.apps.elementAt(i); 
                  return AppCard(
                    name: app.name, 
                    category: app.category, 
                    package: app.package,
                    showTextOverlay: settingsStore.textOverlay
                  );
                }
              ),
            ),
          ),
          // Área livre: o long press aqui abre o pie menu, que agora vive no
          // PieCanvas da HomePage e cobre a tela inteira.
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
