import 'package:flutter/material.dart';
import 'package:launcher/modules/home/presentation/home_controller.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SearchButton extends StatelessWidget{
  const SearchButton({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(LucideIcons.search, color: Color(0xFFF2ECE2),),
      onPressed: (){
        homeController.search(close: false);
      }
    );
  }

}