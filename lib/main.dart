
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: DefaultTabController(
         length: 3,
         child: Scaffold(
           appBar: AppBar(
             title: Text("Food Recipes"),
             backgroundColor: Colors.blue,
             centerTitle: true,
             bottom: TabBar(
               tabs: [
                 Tab(
                   text: "By Category",
                   icon: Icon(Icons.ac_unit)
                 ),
                 Tab(
                   text: "By Country",
                   icon: Icon(Icons.access_alarm_outlined)
                 ),
                 Tab(
                   text : "By Random",
                   icon: Icon(Icons.access_alarms)
                 ),
               ],
             ),
           ),
         ),
       ),
    );
  }
}
