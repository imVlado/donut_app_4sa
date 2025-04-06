import 'package:donut_app_4sa/utils/donut_model.dart';
import 'package:flutter/material.dart';


class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCart> {
  List<DonutModel> cartItems = [];
  int itemCount = 0; // Contador de items en el carrito
  double total = 0.0;

    void addItem(DonutModel item) {
    setState(() {
      itemCount++; // Siempre incrementa el contador
      final existingIndex = cartItems.indexWhere((i) => i.name == item.name);
      if (existingIndex >= 0) {
        cartItems[existingIndex] = cartItems[existingIndex].copyWith(
          quantity: cartItems[existingIndex].quantity + 1,
        );
      } else {
        cartItems.add(item.copyWith(quantity: 1));
      }
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    total = cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cartItems.length} Items | \$${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text("Delivery Charges Included"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: cartItems.isEmpty ? null : () => _showCartDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              "View Cart",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _showCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Cart"),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              for (int i = 0; i < cartItems.length; i++)
                ListTile(
                  leading: Image.asset(cartItems[i].imgUrl, width: 40),
                  title: Text(cartItems[i].name),
                  subtitle: Text("Qty: ${cartItems[i].quantity} | \$${cartItems[i].price.toStringAsFixed(2)} each"),
                  trailing: Text("\$${(cartItems[i].price * cartItems[i].quantity).toStringAsFixed(2)}"),
                ),
              const Divider(),
              Text(
                "Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Continue Shopping"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                cartItems.clear();
                total = 0.0;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Order placed successfully!")),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            child: const Text("Checkout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}