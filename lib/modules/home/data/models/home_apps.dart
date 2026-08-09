import 'dart:typed_data';

import 'package:hive_ce/hive.dart';

part 'home_apps.g.dart';

@HiveType(typeId: 1)
class HomeApps {
  @HiveField(0)
  final String name;

  @HiveField(1)
  String? package;

  @HiveField(2)
  int category;

  @HiveField(3)
  Uint8List? image;
  
  HomeApps({
    required this.name,
    required this.category,
    this.package, 
    this.image
  });
}