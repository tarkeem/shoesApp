import 'package:flutter/material.dart';
import 'package:nike_store/model/shoesProduct.dart';
class cart extends ChangeNotifier
{

  List<shoes> cartItems=[];


  addToCart(shoes prod)
  {
    cartItems.add(prod);

  notifyListeners();
  
  }


  deleteFromCart(shoes prod)
  {
    cartItems.remove(prod);
    notifyListeners();
  }





  






}