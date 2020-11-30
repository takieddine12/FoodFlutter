import 'dart:async';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportapp/random/food_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

   List<FoodModel> _list = new List<FoodModel>();

   Future<FoodModel> fetchFoodCategories() async {
    var url = "https://www.themealdb.com/api/json/v1/1/categories.php";
    var response = await http.get(url);

    if(response.statusCode != 200) return null;
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    fetchFoodCategories().then((value){
      _list.add(value);
    });
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
          body: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context , index)  {
                  return Card(
                      child :Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            children : <Widget>[
                              Text(
                                  _list[index].categories.last.strCategory
                              )
                            ]
                        ),
                      )
                  );
                },
                itemCount: _list.length,
              ),
              ListView.builder(
                itemBuilder: (context , index)  {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text("third Tab"),
                          Text("fourth Tab"),
                          Text("fifth Tab")
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemBuilder: (context , index)  {
                  return Card(
                    child: Column(
                      children: [
                        Text("First Tab"),
                        Text("Second Tab"),
                        Text("Third Tab")
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Text("Food Drawer",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue
                  )
                ),
                ListTile(
                  title: Text("Rate App"),
                  onTap: (){
                    Fluttertoast.showToast(
                      msg: "Rate App Clicked",
                      toastLength: Toast.LENGTH_LONG
                    );
                  },
                ),
                ListTile(
                    title: Text("About App"),
                    onTap: (){
                      Fluttertoast.showToast(
                          msg: "About App Clicked",
                          toastLength: Toast.LENGTH_LONG
                      );
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

