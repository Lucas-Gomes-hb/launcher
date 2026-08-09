import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/modules/settings/presentation/settings_controller.dart';
import 'package:launcher/modules/settings/presentation/widgets/button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          context.navigate("/home");
        },
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Opacidade do fundo",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Observer(
                      builder: (c)=> Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(0.0), value: "0.0", selected: settingsController.settingsStore.wallpaperOpacity == 0.0,),
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(0.3), value: "0.3", selected: settingsController.settingsStore.wallpaperOpacity == 0.3,),
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(0.5), value: "0.5", selected: settingsController.settingsStore.wallpaperOpacity == 0.5,),
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(0.7), value: "0.7", selected: settingsController.settingsStore.wallpaperOpacity == 0.7,),
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(0.9), value: "0.9", selected: settingsController.settingsStore.wallpaperOpacity == 0.9,),
                          ButtonSettings(function:()=> settingsController.setWallpaperOpacity(1.0), value: "1.0", selected: settingsController.settingsStore.wallpaperOpacity == 1.0,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Tema usado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Observer(
                      builder: (c)=> Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          ButtonSettings(
                            function:(){
                              settingsController.settingsStore.theme = ThemeMode.light;
                            }, 
                            value: "Claro", 
                            selected: settingsController.settingsStore.theme == ThemeMode.light,
                          ),
                          ButtonSettings(
                            function:(){
                              settingsController.settingsStore.theme = ThemeMode.dark;
                            }, 
                            value: "Escuro", 
                            selected: settingsController.settingsStore.theme == ThemeMode.dark,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Trocar WallPaper",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonSettings(
                          function:()async{
                            settingsController.setVideoWallPaper();
                          }, 
                          value: "Video", 
                          selected: false,
                        ),
                        ButtonSettings(
                          function:()async{
                            settingsController.setImageWallPaper();
                          }, 
                          value: "Imagem", 
                          selected: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Apps Favoritos",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Observer(
                      builder:(c)=> Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 0);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(0) != null ? LucideIcons.package:LucideIcons.plus , 
                            image: settingsController.settingsStore.apps.elementAtOrNull(0)?.image,
                            selected: false,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 1);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(1) != null ? LucideIcons.package:LucideIcons.plus , 
                            image: settingsController.settingsStore.apps.elementAtOrNull(1)?.image,
                            selected:false,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 2);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(2) != null ? LucideIcons.package:LucideIcons.plus, 
                            image: settingsController.settingsStore.apps.elementAtOrNull(2)?.image,
                            selected:false,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 3);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(3) != null ? LucideIcons.package:LucideIcons.plus, 
                            image: settingsController.settingsStore.apps.elementAtOrNull(3)?.image,
                            selected:false,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 4);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(4) != null ? LucideIcons.package:LucideIcons.plus, 
                            image: settingsController.settingsStore.apps.elementAtOrNull(4)?.image,
                            selected:false,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.selectFavApp(context, 5);
                            }, 
                            icon: settingsController.settingsStore.apps.elementAtOrNull(5) != null ? LucideIcons.package:LucideIcons.plus, 
                            image: settingsController.settingsStore.apps.elementAtOrNull(5)?.image,
                            selected:false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Usar TextOverlay",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Observer(
                      builder:(c)=> Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonSettings(
                            function:()async{
                              settingsController.setTextOverlay(true);
                            }, 
                            value: "Sim", 
                            selected: settingsController.settingsStore.textOverlay == true,
                          ),
                          ButtonSettings(
                            function:()async{
                              settingsController.setTextOverlay(false);
                            }, 
                            value: "Não", 
                            selected: settingsController.settingsStore.textOverlay == false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}