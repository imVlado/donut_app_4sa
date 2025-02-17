import 'package:donut_app_4sa/tabs/burger_tab.dart';
import 'package:donut_app_4sa/tabs/donut_tab.dart';
import 'package:donut_app_4sa/tabs/pancakes.dart';
import 'package:donut_app_4sa/tabs/pizza.dart';
import 'package:donut_app_4sa/tabs/smootie_tab.dart';
import 'package:donut_app_4sa/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myTabs = <Widget>[
    const MyTab(iconPath: 'lib/icons/donut.png',),
    const MyTab(iconPath: 'lib/icons/burger.png',),
    const MyTab(iconPath: 'lib/icons/smoothie.png',),
    const MyTab(iconPath: 'lib/icons/pancakes.png',),
    const MyTab(iconPath: 'lib/icons/pizza.png',),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
           backgroundColor: Colors.transparent,
          //icono de a izquierda
          leading: 
           Padding(
             padding: const EdgeInsets.all(24.0),
             child: Icon(
              Icons.menu, 
                color: Colors.grey[800]
              ),
           ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.person,),
              )],
        ),
        body: Column(
          children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Row(
              children: [
                Text("I want to ", style: TextStyle(
                  fontSize: 20,
                )),
                Text("Eat", style: TextStyle(
                  //tamaño de letra
                  fontSize: 32,
                  //negritas
                  fontWeight: FontWeight.bold,
                  //subrayado
                  decoration: TextDecoration.underline,       
                ),)
              ],
            ),
          ),
        //pestañas
          TabBar(tabs: myTabs),
      
        //Contenido de pestañas
          Expanded(
            child: TabBarView(children: [
              DonutTab(),
              BurgerTab(),
              SmoothieTab(),
              PanCakesTab(),
              PizzaTab(),
            ]),
          )
      
        //carrito
        
      
          ]
          
        //Textp principal
      
        
        ),
      ),
    );
  }
}