import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {

  //list of donuts
  final List donutsOnSale = [
    //[ donutFlavor, donutStore, donutPrice, donutColor, imageName ],
    ["Ice Cream", "Portgas D. Ace", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "Pastelitos Vladymir", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "Navagod Donas", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Karime Panaderia", "95", Colors.brown, "lib/images/chocolate_donut.png"]
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Prepa 1: cómo se va a organizar
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //numero de columnas
        crossAxisCount: 2,
        //Proporcion entre ancho y alto 
        childAspectRatio: 1/1.5),
      //Cuantos elementos
      itemCount: 4,
      padding: const EdgeInsets.all(12),
      //Como se construirán
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutStore: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
        );
      }
    );
  }
}