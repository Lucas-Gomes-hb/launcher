import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:launcher/core/store/battery_store.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BateryCard extends StatelessWidget{
  BateryCard({super.key});

  final BatteryStore batteryStore = inject<BatteryStore>();

  IconData batteryIcon(BatteryState? state){
    if(BatteryState.charging == state) return LucideIcons.batteryCharging;
    if(BatteryState.full == state) return LucideIcons.batteryFull;
    if(int.parse(batteryStore.batteryLevel) < 10) return LucideIcons.batteryLow;
    if(int.parse(batteryStore.batteryLevel) < 50 && int.parse(batteryStore.batteryLevel) >= 10) return LucideIcons.batteryMedium;
    if(int.parse(batteryStore.batteryLevel) >= 50) return LucideIcons.batteryFull;
    return LucideIcons.battery;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: batteryStore.batteryCheck(), 
      builder: (c, d){
        batteryStore.batteryState = d.data;
        return Row(
          spacing: 12,
          children: [
            Icon(batteryIcon(d.data)),
            Column(
              children: [
                Text(
                  "${batteryStore.batteryLevel} %",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if(batteryStore.batteryState != null) Text(
                  "${batteryStore.batteryState?.name.substring(0,1).toUpperCase()}${batteryStore.batteryState?.name.substring(1)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );
  }

}