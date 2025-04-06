import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:donut_app_4sa/utils/shopping_cart.dart';

class PancakesTab extends StatelessWidget {
  final GlobalKey<ShoppingCartState> shoppingCartKey;

  PancakesTab({super.key, required this.shoppingCartKey});

  final List<DonutModel> pancakesOnSale = [
   DonutModel(
      name: "Mini Pancakes",
      description: "ihop",
      price: 40.0,
      imgUrl: "lib/images/pancakes/mini_cakes.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "8 Pancakes",
      description: "ihop",
      price: 40.0,
      imgUrl: "lib/images/pancakes/8_cakes.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Crepe",
      description: "La Creperie",
      price: 36.0,
      imgUrl: "lib/images/pancakes/crepe.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "French Break",
      description: "Denny's",
      price: 60.0,
      imgUrl: "lib/images/pancakes/French_breakfast.png",
      cardColor: Colors.brown,
    ),
     DonutModel(
      name: "Happy Meal",
      description: "Mc Donalds",
      price: 50.0,
      imgUrl: "lib/images/pancakes/happy_meal.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Chocochip Pancakes",
      description: "ihop",
      price: 18.0,
      imgUrl: "lib/images/pancakes/chocochip_pancake.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Strawberry Crepe",
      description: "La Creperie",
      price: 30.0,
      imgUrl: "lib/images/pancakes/strawberry_crepe.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Waffle",
      description: "Denny's",
      price: 25.0,
      imgUrl: "lib/images/pancakes/waffle.png",
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
      itemCount: pancakesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final pancake = pancakesOnSale[index];
        return DonutTile(
          donutFlavor: pancake.name,
          donutStore: pancake.description,
          donutPrice: pancake.price.toStringAsFixed(0),
          donutColor: pancake.cardColor ?? Colors.amber,
          imageName: pancake.imgUrl,
          onAddToCart: () {
            shoppingCart?.addItem(pancake);
  
          },
        );
      },
    );
  }
}