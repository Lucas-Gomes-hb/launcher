import 'package:flutter/material.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:launcher/modules/settings/domain/wallpaper_service.dart';
import 'package:launcher/modules/settings/presentation/widgets/list_apps.dart';

class SettingsController {
  SettingsController({required this.settingsStore});
  final SettingsStore settingsStore;
  final WallpaperService wallpaperService = WallpaperService();

  void setWallpaperOpacity(double value){
    settingsStore.setWallpaperOpacity(value);
  }

  void setVideoWallPaper(){
    wallpaperService.changeToVideo();
  }

  void setImageWallPaper(){
    wallpaperService.changeToImage();
  }
  
  void selectFavApp(BuildContext context,int index){
    showModalBottomSheet(
      context: context, 
      builder: (c){
        return ListApps(
          function: (app) {
            setFavApp(index, app);
            Navigator.pop(context);
          },
        );
      }
    );
  }

  void setFavApp(int index, HomeApps app){
    settingsStore.setFavApp(index, app);
  }

  void removeFavApp(int index){
    settingsStore.removeFavApp(index);
  }

  void setTextOverlay(bool status){
    settingsStore.setTextOverlay(status);
  }

  void setTheme(ThemeMode mode){
    settingsStore.setTheme(mode);
  }
}