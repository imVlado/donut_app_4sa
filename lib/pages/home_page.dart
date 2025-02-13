import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 255, 0),
      appBar: AppBar(
         backgroundColor: Colors.transparent,
        //icono de a izquierda
        leading:
         Icon(
          Icons.menu, 
            color: Colors.grey[800]
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(
                Icons.person,),
            )],
      ),
      body: Column(
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Text("I want to "),
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
        )


        ]
        
      //Textp principal

      //pestañas

      //Contenido de pestañas

      //carrito
      
      ),
    );
  }
}