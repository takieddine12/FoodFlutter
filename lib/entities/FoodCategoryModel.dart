
import 'dart:convert';

class FoodCategoryModel{
  String strCategory;
  String strCategoryThumb;

  FoodCategoryModel(this.strCategory,this.strCategoryThumb);

  FoodCategoryModel.fromJson(Map<String , dynamic> json)
   : strCategory = json['strCategory'],
     strCategoryThumb = json['strCategoryThumb'];

}