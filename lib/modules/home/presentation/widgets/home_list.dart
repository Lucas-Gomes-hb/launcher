import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:launcher/modules/home/presentation/widgets/app_card.dart';

class HomeList extends StatelessWidget{
  HomeList({super.key});

  final HomeStore homeStore = inject<HomeStore>();
  final SettingsStore settingsStore = inject<SettingsStore>();
  final double itemHeight = 40;

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          
          return ListView.builder(
            shrinkWrap: true,
            itemExtent: itemHeight,
            itemCount: homeStore.apps.length,
            itemBuilder: (c,i){
              HomeApps app = homeStore.apps.elementAt(i); 
              
              return AppCard(
                name: app.name, 
                category: app.category, 
                showTextOverlay: settingsStore.textOverlay
              );
            }
          );
        }
      ),
    );
  }
}