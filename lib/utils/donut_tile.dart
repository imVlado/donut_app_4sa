import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutStore;
  final String donutPrice;
    //dynamic por que será de tipo color
  final dynamic donutColor;
  final String imageName;

  const DonutTile(
    {super.key,
    required this.donutFlavor,
    required this.donutStore,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        //color: donutColor[50]
        decoration: BoxDecoration(
          color: donutColor[50],
          //Esquinas redondeadas
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  child:Text(
                    "\$$donutPrice",
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: donutColor[800],
                    )
                  ),
                ),
              ],
            ),

            //Donut price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Image.asset(imageName),
            ),

            //Donut Flavor Text
            Text(
                    donutFlavor,
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    )
                  ),
            Text(
                    donutStore,
                    style:TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    )
                  ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey[800],
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Elimina el padding interno del botón
                      minimumSize: Size(29, 29), // Reduce el tamaño mínimo del botón
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce el área táctil
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}