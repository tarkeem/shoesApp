import 'package:flutter/material.dart';

class shoes {
  String model;
  double currentPrice, oldPrice;
  List<String> prodImages;
  int model_num;
  Color col;
  shoes({
    required this.model,
    required this.model_num,
    required this.oldPrice,
    required this.currentPrice,
    required this.prodImages,
    required this.col
  });
}

List<shoes> shoesItem = [
  shoes(
      model: 'Nike Shadow',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes1_1.png',
        'assets/images/shoes1_2.png',
        'assets/images/shoes1_3.png'
      ],col: Color.fromARGB(255, 78, 77, 77)),
  shoes(
      model: 'Nike Solar',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes2_1.png',
        'assets/images/shoes2_2.png',
        'assets/images/shoes2_3.png'
      ],col: Colors.yellow),
  shoes(
      model: 'Nike Red Fury',
      model_num: 10,
      oldPrice: 20,
      currentPrice: 30,
      prodImages: [
        'assets/images/shoes3_1.png',
        'assets/images/shoes3_2.png',
        'assets/images/shoes3_3.png'
      ],col: Colors.red),
  
];
