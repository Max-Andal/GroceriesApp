import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [ItemName, ItemPrice, ImagePath, color]
    ["avocado", "4.00", "images/avocado.png", Colors.green],
    ["banana", "2.50", "images/banana.png", Colors.yellow],
    ["chicken", "12.80", "images/chicken.png", Colors.brown],
    ["Water", "1.00", "images/water.jpeg", Colors.blue],

  ];

  List _cartItems = [];
  get shopItems => _shopItems;

  get cartItems => _cartItems;


  //add item into cart
  void addItemCart (int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item into cart

  void removeItemCart (int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price

  String calculateTotal (){
    double totalPrice = 0;
    for(int i =0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}