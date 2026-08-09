// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BatteryStore on _BatteryStore, Store {
  late final _$batteryLevelAtom = Atom(
    name: '_BatteryStore.batteryLevel',
    context: context,
  );

  @override
  String get batteryLevel {
    _$batteryLevelAtom.reportRead();
    return super.batteryLevel;
  }

  @override
  set batteryLevel(String value) {
    _$batteryLevelAtom.reportWrite(value, super.batteryLevel, () {
      super.batteryLevel = value;
    });
  }

  late final _$batteryStateAtom = Atom(
    name: '_BatteryStore.batteryState',
    context: context,
  );

  @override
  BatteryState? get batteryState {
    _$batteryStateAtom.reportRead();
    return super.batteryState;
  }

  @override
  set batteryState(BatteryState? value) {
    _$batteryStateAtom.reportWrite(value, super.batteryState, () {
      super.batteryState = value;
    });
  }

  @override
  String toString() {
    return '''
batteryLevel: ${batteryLevel},
batteryState: ${batteryState}
    ''';
  }
}
