import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/app/app_module.dart';
import 'package:launcher/app/app_page.dart';
import 'package:launcher/core/storage/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveService = HiveService();
  await hiveService.init(); 

  runApp(
    ModularApp(
      module: AppModule(hiveService), 
      initialRoute: "/home",
      child: const AppPage(),
    ),
  );
}