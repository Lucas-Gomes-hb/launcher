import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/settings_store.dart';
import 'package:launcher/modules/home/presentation/home_controller.dart';
import 'package:launcher/modules/home/presentation/home_store.dart';
import 'package:launcher/modules/home/presentation/widgets/home_list.dart';
import 'package:launcher/modules/home/presentation/widgets/pie_canvas.dart';
import 'package:launcher/modules/home/presentation/widgets/search_button.dart';
import 'package:launcher/modules/home/presentation/widgets/search_bar.dart';
import 'package:launcher/modules/home/presentation/widgets/utils_card.dart';

class HomePage extends StatefulWidget{
  const HomePage({
    super.key, 
    required this.homeStore, 
    required this.homeController, 
    required this.settingsStore,
  });

  final HomeStore homeStore;
  final HomeController homeController;
  final SettingsStore settingsStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.apps();

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: false,
      // O PieCanvas envolve o Scaffold para o overlay do pie menu renderizar
      // em tela cheia, em vez de ficar preso dentro de uma coluna da lista.
      child: PieCanvasSca(
        child: Observer(
          builder:(c) => Scaffold(
            body: SafeArea(
              child: GestureDetector(
                onDoubleTap: (){
                  context.navigate('/settings');
                },
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UtilsCard(),
                    HomeList(),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: !widget.homeStore.searchActive ?  FloatingActionButtonLocation.endFloat :FloatingActionButtonLocation.centerFloat,
            floatingActionButton: !widget.homeStore.searchActive ? SearchButton(
              homeController: widget.homeController,
            ) : SearchBar(
              homeController: widget.homeController, 
              homeStore: widget.homeStore,
            ),
          ),
        ),
      ),
    );
  }
}
