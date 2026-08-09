import 'package:flutter/material.dart';
import 'package:installed_apps/app_category.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class IconService {
  IconData icon(int category){
    if(category == AppCategory.undefined.index) return LucideIcons.package;
    if(category == AppCategory.productivity.index) return LucideIcons.target;
    if(category == AppCategory.maps.index) return LucideIcons.mapPinSearch;
    if(category == AppCategory.news.index) return LucideIcons.newspaper;
    if(category == AppCategory.video.index) return LucideIcons.video;
    if(category == AppCategory.image.index) return LucideIcons.image;
    if(category == AppCategory.game.index) return LucideIcons.dices;
    if(category == AppCategory.social.index) return LucideIcons.thumbsUp;
    if(category == AppCategory.audio.index) return LucideIcons.audioLines;
    return Icons.circle;
  }
}