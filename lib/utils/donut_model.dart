import 'package:flutter/material.dart';

class DonutModel {
  final String name;
  final String description;
  final double price;
  final String imgUrl;
  final Color? cardColor;
  int quantity;

  DonutModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imgUrl,
    this.cardColor,
    this.quantity = 1,
  });

  DonutModel copyWith({
    String? name,
    String? description,
    double? price,
    String? imgUrl,
    Color? cardColor,
    int? quantity,
  }) {
    return DonutModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      cardColor: cardColor ?? this.cardColor,
      quantity: quantity ?? this.quantity,
    );
  }
}