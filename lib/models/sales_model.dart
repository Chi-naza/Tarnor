import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tanor/models/product_model.dart';

class SalesModel {
  List<ProductModel> product;
  String whoSoldIt;
  String time;
  String date;

  SalesModel({
    required this.product,
    required this.whoSoldIt,
    required this.time,
    required this.date
  });



  SalesModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    product = (snapshot['product'] as List).map((e) => ProductModel.fromJson(e)).toList(),
    whoSoldIt = snapshot['who_sold_it'],
    time = snapshot['time'],
    date = snapshot['date'];



  SalesModel.fromJson(Map<String, dynamic> json):
    product = (json['product'] as List).map((e) => ProductModel.fromJson(e)).toList(),
    whoSoldIt = json['who_sold_it'],
    time = json['time'],
    date = json['date'];


  
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['who_sold_it'] = this.whoSoldIt;
    data['time'] = this.time;
    data['date'] = this.date;
    return data;
  }

}