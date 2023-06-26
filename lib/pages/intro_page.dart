import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinemarker/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Logo
            Padding(
              padding: const EdgeInsets.only(top: 160.0, left: 80, right: 80, bottom: 40),
              child: Image.asset('images/avocado.png'),
            ),
            //Welcoming Text
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('We deliver Anything to your door steps', style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 24,),
            //Quality Items
            Text('Quality over Price', style: TextStyle(color: Colors.grey.shade600),),
            Spacer(),
            //get started Button
            GestureDetector(
              onTap:()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(24),
                child: Text("Get Started", style: TextStyle(color: Colors.white,),),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

