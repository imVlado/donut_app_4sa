import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:donut_app_4sa/utils/donut_tile.dart'; 
import 'package:donut_app_4sa/utils/shopping_cart.dart';

class SmoothieTab extends StatelessWidget {
  final GlobalKey<ShoppingCartState> shoppingCartKey;

  SmoothieTab({super.key, required this.shoppingCartKey});

  final List<DonutModel> smoothiesOnSale = [
    DonutModel(
      name: "Strawberry Smoothie",
      description: "ihop",
      price: 40.0,
      imgUrl: "lib/images/smoothie/strawberry_smoothie.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Orange Smoothie",
      description: "Smoothie King",
      price: 40.0,
      imgUrl: "lib/images/smoothie/orange_smoothie.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Fruit Mix Smoothie",
      description: "Smoothie King",
      price: 50.0,
      imgUrl: "lib/images/smoothie/fruitmix_smoothie.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Pineapple Smoothie",
      description: "Smoothie King",
      price: 42.0,
      imgUrl: "lib/images/smoothie/pineapple_smoothie.png",
      cardColor: Colors.brown,
    ),
     DonutModel(
      name: "Matcha Tea",
      description: "Starbucks",
      price: 50.0,
      imgUrl: "lib/images/smoothie/matcha_tea.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Bubble Tea",
      description: "Starbucks",
      price: 60.0,
      imgUrl: "lib/images/smoothie/bubble_tea.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Strawberry Juice",
      description: "Smoothie King",
      price: 35.0,
      imgUrl: "lib/images/smoothie/strawberry_juice.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Cocolate Smoothie",
      description: "Denny's",
      price: 30.0,
      imgUrl: "lib/images/smoothie/chocolate_milk.png",
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
      itemCount: smoothiesOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final smoothie = smoothiesOnSale[index];
        return DonutTile(
          donutFlavor: smoothie.name,
          donutStore: smoothie.description,
          donutPrice: smoothie.price.toStringAsFixed(0),
          donutColor: smoothie.cardColor?? Colors.pink,
          imageName: smoothie.imgUrl,
          onAddToCart: () {
            shoppingCart?.addItem(smoothie);
            
        
          },
        );
      },
    );
  }
}