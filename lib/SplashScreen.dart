

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';


void main(){
    runApp(new SplashScreen());
}

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         body: Container(
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Lottie.network(
                     'https://assets8.lottiefiles.com/packages/lf20_HX0isy.json',
                     repeat: false,
                     reverse: false,
                     animate: false
                 ),
                 RaisedButton(
                   child: Text("Move To Next Screen"),
                   onPressed: () {
                     Timer(Duration(seconds: 3), (){

                     });
                   },
                 )
               ],
             ),
           ),
         ),
       ),

    );
  }
}
