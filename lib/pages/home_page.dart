import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinemarker/components/product_item_tile.dart';
import 'package:onlinemarker/model/cart_model.dart';
import 'package:onlinemarker/pages/cart_page.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
        
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48,),
            // greeting Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good Morning'),
            ),
            SizedBox(height: 4,),
            //lets order some items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Let's order Fresh Items for you", style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),),
            ),
            // divider
            SizedBox(height: 24,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Divider(),),
            SizedBox(height: 24,),
            // fresh items + grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Brand New Items', style: TextStyle(fontSize: 16),),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child){
              return GridView.builder(
                padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemCount: value.shopItems.length,
                  itemBuilder: (context, index){
                return ProductItemTile(
                  onPressed:() => Provider.of<CartModel>(context, listen: false).addItemCart(index),
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                );
              });
            },))
          ],
        ),
      ),
    );
  }
}
