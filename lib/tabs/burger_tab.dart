import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:donut_app_4sa/utils/shopping_cart.dart';

class BurgerTab extends StatelessWidget {
  final GlobalKey<ShoppingCartState> shoppingCartKey;

  BurgerTab({super.key, required this.shoppingCartKey});

  final List<DonutModel> burgersOnSale = [
  DonutModel(
      name: "Cheese Burger",
      description: "Mc Donalds",
      price: 40.0,
      imgUrl: "lib/images/burgers/cheese_burger.png",
      cardColor: Colors.blue,
  
    ),
    DonutModel(
      name: "Bacon Burger",
      description: "Mc Donalds",
      price: 55.0,
      imgUrl: "lib/images/burgers/bacon_burger.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Chicken King",
      description: "burger King",
      price: 50.0,
      imgUrl: "lib/images/burgers/chickenking_burger.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Mushroom Burger",
      description: "Don Burguer",
      price: 48.0,
      imgUrl: "lib/images/burgers/mushroom_burger.png",
      cardColor: Colors.brown,
    ), 
    DonutModel(
      name: "Chicken Sandwich",
      description: "KFC",
      price: 53.0,
      imgUrl: "lib/images/burgers/chicken_burger.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Crispy Chicken",
      description: "KFC",
      price: 57.0,
      imgUrl: "lib/images/burgers/crispyChiken_burger.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Big Mac",
      description: "Mc Donalds",
      price: 70.0,
      imgUrl: "lib/images/burgers/bigmac_burger.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Double Cheese Burger",
      description: "Mc Donalds",
      price: 65.0,
      imgUrl: "lib/images/burgers/doble_burger.png",
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
      itemCount: burgersOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final burger = burgersOnSale[index];
        return DonutTile(
          donutFlavor: burger.name,
          donutStore: burger.description,
          donutPrice: burger.price.toStringAsFixed(0),
          donutColor: burger.cardColor ?? Colors.amber,
          imageName: burger.imgUrl,
          onAddToCart: () {
            shoppingCart?.addItem(burger);
            
          },
        );
      },
    );
  }
}