import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //prepa 1
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Numero de columnas
        crossAxisCount: 2,    
        ),
      //cuantos elementos
      itemCount: 2,
      padding : const EdgeInsets.all(12),
      itemBuilder: (context, index){
        return;
      }
  
      );
  }
}