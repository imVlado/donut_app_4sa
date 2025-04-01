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
  List <Widget> myTabs = <Widget>[
    const MyTab(iconPath: 'lib/icons/donut.png',),
    const MyTab(iconPath: 'lib/icons/burger.png',),
    const MyTab(iconPath: 'lib/icons/smoothie.png',),
    const MyTab(iconPath: 'lib/icons/pancakes.png',),
    const MyTab(iconPath: 'lib/icons/pizza.png',),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono de la izquierda
          leading: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.menu, color: Colors.grey[800]),
          ),
          actions: [Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.person),
          )]
        ),
        body: Column(
          children: <Widget>[
            //1. Texto Principal (Text)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Text("I want to ", style: TextStyle(
                  fontSize: 32
                )),
                Text("Eat...", style: TextStyle(
                  //Tamaño de letra
                  fontSize: 32,
                  //Negritas
                  fontWeight: FontWeight.bold,
                  //Subrayado
                  decoration: TextDecoration.underline,
                ),),
              ],
            ),
          ),
          //2. Pestañas (TabBar)
          TabBar(tabs: myTabs, splashFactory: NoSplash.splashFactory), //quitar efecto splash de los iconos
          //3. Contenido de Pestañas (TabBarView)
          Expanded(
            child: TabBarView(
              children: [
              DonutTab(),
              BurgerTab(),
              SmoothieTab(),
              PanCakesTab(),
              PizzaTab(),
            ]),
          )
          //4. Carrito (Cart)
          ],
        ),
      ),
    );
  }
}