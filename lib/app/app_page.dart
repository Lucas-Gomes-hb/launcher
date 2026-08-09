import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/core/theme/theme.dart';

class AppPage extends StatelessWidget{
  const AppPage({super.key});

  @override
  Widget build(BuildContext context){
    SettingsStore settingsStore = inject<SettingsStore>();
    
    return Observer(
      builder: (c)=> MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Laucher",
        theme: AppTheme.light(surfaceOpacity: settingsStore.wallpaperOpacity),
        darkTheme: AppTheme.dark(surfaceOpacity: settingsStore.wallpaperOpacity),
        themeMode: settingsStore.theme,
        routerConfig: ModularApp.routerConfigOf(context),
      ),
    );
  }
}