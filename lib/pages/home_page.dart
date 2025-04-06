import 'package:donut_app_4sa/utils/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_4sa/utils/my_tab.dart';
import 'package:donut_app_4sa/tabs/donut_tab.dart';
import 'package:donut_app_4sa/tabs/burger_tab.dart';
import 'package:donut_app_4sa/tabs/smootie_tab.dart';
import 'package:donut_app_4sa/tabs/pancakes_tab.dart';
import 'package:donut_app_4sa/tabs/pizza_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ShoppingCartState> _shoppingCartKey = GlobalKey();

  List<Widget> myTabs = const [
    MyTab(iconPath: 'lib/icons/donut.png', label: "Donuts"),
    MyTab(iconPath: 'lib/icons/burger.png', label: "Burgers"),
    MyTab(iconPath: 'lib/icons/smoothie.png', label: "Smoothies"),
    MyTab(iconPath: 'lib/icons/pancakes.png', label: "Pancakes"),
    MyTab(iconPath: 'lib/icons/pizza.png', label: "Pizza"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.menu, color: Colors.grey[800]),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.person),
            )
          ]
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 32)),
                  Text("Eat...", 
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(tabs: myTabs, splashFactory: NoSplash.splashFactory),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(shoppingCartKey: _shoppingCartKey),
                  BurgerTab(shoppingCartKey: _shoppingCartKey),
                  SmoothieTab(shoppingCartKey: _shoppingCartKey),
                  PancakesTab(shoppingCartKey: _shoppingCartKey),
                  PizzaTab(shoppingCartKey: _shoppingCartKey),
                ],
              ),
            ),
            ShoppingCart(key: _shoppingCartKey)
          ],
        ),
      ),
    );
  }
}