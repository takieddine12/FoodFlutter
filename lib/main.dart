import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportapp/random/food_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

   var foodList = new List<FoodModel>();
   List<FoodModel> list = new List<FoodModel>();

   Future<List<FoodModel>> fetchFoodCategories() async {
    var url = "https://www.themealdb.com/api/json/v1/1/categories.php";
    var response = await http.get(url);

    if(response.statusCode == 200) {
      foodList.add(json.decode(response.body));
    }
    return foodList;
  }
  @override
  Widget build(BuildContext context) {
    fetchFoodCategories().then((value){
      list.addAll(value);
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
                                  list[index].categories[index].strCategory
                              )
                            ]
                        ),
                      )
                  );
                },
                itemCount: list.length,
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
        ),
      ),
    );
  }
}

