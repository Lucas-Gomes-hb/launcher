import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';
import 'package:launcher/modules/home/presentation/widgets/batery_card.dart';
import 'package:launcher/modules/home/presentation/widgets/date_card.dart';

class UtilsCard extends StatelessWidget{
  const UtilsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        InstalledApps.startApp("com.google.android.deskclock");
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: StreamBuilder(
          stream: Stream.periodic(
            Duration(seconds: 1),
            (_)=> DateTime.now()
          ), 
          builder: (c, d) {
            final now = d.data ?? DateTime.now();
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("HH:mm").format(now),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        DateCard(now: now),
                        BateryCard()
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ],
            );  
          }
        ),
      ),
    );
  }

}