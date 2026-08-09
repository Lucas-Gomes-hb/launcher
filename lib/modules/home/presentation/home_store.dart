// ignore_for_file: library_private_types_in_public_api

import 'package:launcher/modules/home/data/models/home_apps.dart';
import 'package:mobx/mobx.dart';
import 'package:pie_menu/pie_menu.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  @observable
  ObservableList<HomeApps> apps = ObservableList();

  @observable
  bool searchActive = false;

  @observable
  String term = "";

  @observable
  PieCanvasController pieController = PieCanvasController();
}