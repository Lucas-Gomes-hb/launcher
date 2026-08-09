import 'package:flutter/material.dart';
import 'package:launcher/modules/home/presentation/home_controller.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';

class SearchBar extends StatelessWidget{
  const SearchBar({super.key, required this.homeController, required this.homeStore});

  final HomeController homeController;
  final HomeStore homeStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        textInputAction: TextInputAction.done,
        onChanged: (value) {
          homeStore.term = value;
          homeController.sortBySearch();
        },
        onSubmitted: (value) {
          homeController.sortBySearch();
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){
              homeController.search(close: true);
            }, 
            child: Icon(Icons.close,)
          ),
        ),
      ),
    );
  }

}