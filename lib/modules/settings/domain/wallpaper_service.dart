import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';

class WallpaperService {
  void changeToVideo()async{
    var file = await FilePicker.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );
    if(file == null) return;
    WallpaperManagerPlus().setLiveWallpaper(file.files.first.path);
  }

  void changeToImage()async{
    var file = await FilePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if(file == null) return;
    WallpaperManagerPlus().setWallpaper(File(file.files.first.path ?? ""), WallpaperManagerPlus.homeScreen);
  }
}