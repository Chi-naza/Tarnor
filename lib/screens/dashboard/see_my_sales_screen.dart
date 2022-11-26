import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/controllers/auth_controller.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/lists/product_item_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/models/user_model.dart';

class SeeMySalesScreen extends GetView<AuthController> {
  final UserModel user;
  
  const SeeMySalesScreen({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // checking if current user is being fetched,  if true, show circularProgressIndicator
        // if fetched, we check if user has made any sales. if there are sales we show list of user's sales 
        // otherwise we show 'no sales text'
          return controller.isLoading.value? const Center(
            child: CircularProgressIndicator(),
          ) : (user.mySales.isEmpty)? Center(child: Text('No Sales Yet', style: headline5)) : SingleChildScrollView(
            child: Column(
              children: [
                const HeaderWidget(),
                const TextnDividerHeader(text: "My Sales"),
                 // LIST OF ALL SALES
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: user.mySales.length,     
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>  SizedBox(height: Dimensions.size9),   
                    itemBuilder: (BuildContext context, int index){
                      var sale = user.mySales[index];                   
                      return  InkWell(
                        onTap: (() {                     
                        }),
                        child: ProductItemWidget(
                          productName: sale.productName, // name
                          time: '${DateFormat.jm().format(sale.dateCreated)} ',  
                          date: sale.date, // date
                          price: sale.totalAmount, // totalAmount
                          quantity: sale.unitSold.toString(), // quantity sold
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(height: Dimensions.size30),
              ],
            ),
          );
        }
      ),
    );
  }
}