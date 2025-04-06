import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:donut_app_4sa/utils/shopping_cart.dart';

class DonutTab extends StatelessWidget {
  final GlobalKey<ShoppingCartState> shoppingCartKey;

 DonutTab({super.key, required this.shoppingCartKey});

  final List<DonutModel> donutsOnSale = [
    DonutModel(
      name: "Ice Cream",
      description: "Krispy Kreme",
      price: 12.0,
      imgUrl: "lib/images/donuts/icecream_donut.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Strawberry",
      description: "Krispy Kreme",
      price: 10.0,
      imgUrl: "lib/images/donuts/strawberry_donut.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Grape Ape",
      description: "Krispy Kreme",
      price: 8,
      imgUrl: "lib/images/donuts/grape_donut.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Choco",
      description: "Krispy Kreme",
      price: 9.0,
      imgUrl: "lib/images/donuts/chocolate_donut.png",
      cardColor: Colors.brown,
    ), 
    DonutModel(
      name: "Coco",
      description: "Dunkin Donuts",
      price: 12.0,
      imgUrl: "lib/images/donuts/coco_donut.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Blueberry",
      description: "Dunkin Donuts",
      price: 12.0,
      imgUrl: "lib/images/donuts/blueberry_donut.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Caramel",
      description: "Dunkin Donuts",
      price: 10.0,
      imgUrl: "lib/images/donuts/caramel_donut.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Orange",
      description: "Dunkin Donuts",
      price: 15.0,
      imgUrl: "lib/images/donuts/orange_donut.png",
      cardColor: Colors.brown,
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    final shoppingCart = shoppingCartKey.currentState;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final donut = donutsOnSale[index];
        return DonutTile(
          donutFlavor: donut.name,
          donutStore: donut.description,
          donutPrice: donut.price.toStringAsFixed(0),
          donutColor: donut.cardColor ?? Colors.grey,
          imageName: donut.imgUrl,
          onAddToCart: () {
            shoppingCart?.addItem(donut);
            
          },
        );
      },
    );
  }
}