import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinemarker/model/cart_model.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("My Cart", style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                leading: Image.asset(value.cartItems[index][2], height: 36,),
                                title: Text(value.cartItems[index][0]),
                                subtitle: Text(value.cartItems[index][1] + "\$"),
                                trailing: IconButton(
                                  icon: Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemCart(index),
                                ),
                              ),
                            ),
                          );
                        }
                    )
                ),

                //Calculate + pay now
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Total Prices", style: TextStyle(color: Colors.green.shade50),),
                           Text(value.calculateTotal() + "\$",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold
                                 , fontSize: 18,
                             ),),
                         ],
                       ),
                        //pay Now Button
                        GestureDetector(
                          onTap: () {
                            print( "pay" + value.calculateTotal());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(horizontal: BorderSide(width: 0.1,color: Colors.white)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "pay NOW",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
