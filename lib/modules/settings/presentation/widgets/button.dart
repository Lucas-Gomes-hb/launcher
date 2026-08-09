import 'dart:typed_data';

import 'package:flutter/material.dart';

class ButtonSettings extends StatelessWidget{
  
  const ButtonSettings({super.key, required this.function, this.value, this.selected,this.icon, this.image});
  
  final VoidCallback function;
  final String? value;
  final bool? selected;
  final IconData? icon;
  final Uint8List? image;
  
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ?? false ?  Theme.of(context).floatingActionButtonTheme.backgroundColor : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(16),
          child: (image != null)? Image.memory(image!,fit: BoxFit.cover,) : Column(
            children: [
              if(value != null)Text(
                value?.toString() ?? "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selected ?? false ? Colors.white : Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              if(icon != null) Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}