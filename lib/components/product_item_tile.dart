import 'package:flutter/material.dart';


class ProductItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;
  final  color;
  ProductItemTile({Key? key, required this.color, required this.imagePath, required this.itemName, required this.itemPrice, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image Path
            Image.asset(imagePath, height: 64,),
            //itemName
            Text(itemName),
            //itemPrice+Button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                itemPrice + "\$",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
