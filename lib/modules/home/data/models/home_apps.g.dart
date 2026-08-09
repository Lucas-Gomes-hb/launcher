// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_apps.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeAppsAdapter extends TypeAdapter<HomeApps> {
  @override
  final typeId = 1;

  @override
  HomeApps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeApps(
      name: fields[0] as String,
      category: (fields[2] as num).toInt(),
      package: fields[1] as String?,
      image: fields[3] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeApps obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.package)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeAppsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
