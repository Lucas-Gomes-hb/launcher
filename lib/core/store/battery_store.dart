import 'package:battery_plus/battery_plus.dart';
import 'package:mobx/mobx.dart';

part 'battery_store.g.dart';

class BatteryStore = _BatteryStore with _$BatteryStore;

abstract class _BatteryStore with Store{
  final Battery battery = Battery();

  @observable
  String batteryLevel = '0';

  @observable
  BatteryState? batteryState;

  Stream<dynamic> batteryCheck(){
    battery.batteryLevel.then((b)=>batteryLevel = b.toString());
    return battery.onBatteryStateChanged;
  }
}