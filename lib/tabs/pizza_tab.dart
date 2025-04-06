import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:donut_app_4sa/utils/donut_tile.dart';
import 'package:donut_app_4sa/utils/shopping_cart.dart';


class PizzaTab extends StatelessWidget {
  final GlobalKey<ShoppingCartState> shoppingCartKey;

  PizzaTab({super.key, required this.shoppingCartKey});

  final List<DonutModel> pizzasOnSale = [
    DonutModel(
      name: "Peperoni Pizza",
      description: "Pizza Hut",
      price: 100.0,
      imgUrl: "lib/images/pizza/peperoni.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Margherita Pizza",
      description: "Italian Pizza",
      price: 120.0,
      imgUrl: "lib/images/pizza/margarita.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Hawaiian Pizza",
      description: "Domino's",
      price: 110.0,
      imgUrl: "lib/images/pizza/hawaiian.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Margherita Peperoni",
      description: "Italian Pizza",
      price: 125.0,
      imgUrl: "lib/images/pizza/margarita_peperoni.png",
      cardColor: Colors.brown,
    ),
     DonutModel(
      name: "Olive Pizza",
      description: "Pizza Hut",
      price: 110.0,
      imgUrl: "lib/images/pizza/olives.png",
      cardColor: Colors.blue,
    ),
    DonutModel(
      name: "Spicy Chicken Pizza",
      description: "Domino's",
      price: 130.0,
      imgUrl: "lib/images/pizza/spicy_chicken.png",
      cardColor: Colors.red,
    ),
    DonutModel(
      name: "Olive Slice",
      description: "Italian Pizza",
      price: 35.0,
      imgUrl: "lib/images/pizza/olive_slice.png",
      cardColor: Colors.purple,
    ),
    DonutModel(
      name: "Mushroom Slice",
      description: "Italian Pizza",
      price: 30.0,
      imgUrl: "lib/images/pizza/mushroom.png",
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
      itemCount: pizzasOnSale.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final pizza = pizzasOnSale[index];
        return DonutTile(
          donutFlavor: pizza.name,
          donutStore: pizza.description,
          donutPrice: pizza.price.toStringAsFixed(0),
          donutColor: pizza.cardColor ?? Colors.amber,
          imageName: pizza.imgUrl,
          onAddToCart: () {
            shoppingCart?.addItem(pizza);
            ScaffoldMessenger.of(context).showSnackBar;
            
          },
        );
      },
    );
  }
}