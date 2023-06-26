import 'package:flutter/material.dart';
import 'package:onlinemarker/model/cart_model.dart';
import 'package:onlinemarker/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>
        CartModel(),
        child: MaterialApp(
      title: 'Groceries Market',
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    ));

  }
}
