import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/controllers/auth_controller.dart';
import 'package:tanor/controllers/product_controller.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/custom_widgets/inputs/input_field_plus_text.dart';
import 'package:tanor/custom_widgets/buttons/main_button.dart';
import 'package:tanor/models/product_model.dart';
import 'package:tanor/utilities/feedback.dart';

class SellAProductScreen extends StatefulWidget {
  final ProductModel product;

  const SellAProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<SellAProductScreen> createState() => _SellAProductScreenState();
}

class _SellAProductScreenState extends State<SellAProductScreen> {

   // input controllers
  TextEditingController unitSoldController = TextEditingController();
  TextEditingController soldToWhoController = TextEditingController();


  // Form key
  var sellProdFormKey = GlobalKey<FormState>();
  var soldToFormKey = GlobalKey<FormState>();

  // product controller instance
  ProductController productController = Get.find<ProductController>();
  // auth controller instance
  AuthController authController = Get.find<AuthController>();  


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            const HeaderWidget(),
            const TextnDividerHeader(text: 'Sell A Product', wantDivider: false),
            // The form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Material(
                elevation: 4,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.size15), 
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.size5, vertical: Dimensions.size20),
                  child: Column(
                    children: [
                      Obx(() {
                          return Column(
                            children: [
                              // productName to be sold,  
                              Row(
                                children: [
                                  Expanded(
                                    child: AbsorbPointer(
                                      child: InputFieldPlusTextWidget(
                                        text: '', 
                                        textController: TextEditingController(),
                                        myHintText: widget.product.name.toUpperCase(), // product name
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.size15),
                              // Unit Sold & Total
                              Row(
                                children: [
                                    Expanded(
                                    child: Form(
                                      key: sellProdFormKey,
                                      child: InputFieldPlusTextWidget(
                                        text: 'Unit', 
                                        textController: unitSoldController, 
                                        isItForNumber: true,
                                        onChanged: (value) {
                                            print('I just changed: $value');// testing  
                                            // Calling the updateSellVariables fro productController                                                                                                                       
                                            productController.updateProductSellVariables(double.parse(unitSoldController.text.trim()), double.parse(widget.product.amount)); // amount from productModel                              
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.size10),
                                  // Total Amount
                                  Expanded(
                                    child: AbsorbPointer(
                                      child: InputFieldPlusTextWidget(
                                        text: 'Total Amount', 
                                        textController: TextEditingController(),
                                        myHintText: productController.sellProductTotalAmount.toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.size15),
                              // Current Date & Time from our Product Controller using DateTime
                              Row(
                                children: [
                                    Expanded(
                                    child: AbsorbPointer(
                                      child: InputFieldPlusTextWidget(
                                        text: 'Time', 
                                        textController: TextEditingController(), 
                                        myHintText: productController.myTime.value,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.size10),
                                  // SELECT COLOR
                                  Expanded(
                                    child: AbsorbPointer(
                                      child: InputFieldPlusTextWidget(
                                        text: 'Date', 
                                        textController: TextEditingController(),
                                        myHintText: productController.myDate.value,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.size15),                                        
                              // Sold To
                              Row(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: soldToFormKey,
                                      child: InputFieldPlusTextWidget(
                                        text: 'Sold To', 
                                        textController: soldToWhoController,                                         
                                      ),
                                    ),
                                  ),                        
                                ],
                              ),         
                              SizedBox(height: Dimensions.size15),                                        
                              // Who is Selling?
                              Row(
                                children: [
                                  Expanded(
                                    child: AbsorbPointer(
                                      child: InputFieldPlusTextWidget(
                                        text: 'Sold By', 
                                        textController: TextEditingController(),
                                        myHintText: authController.getCurrentUser()!.email,
                                      ),
                                    ),
                                  ),                                
                                ],
                              ),                                    
                            ],
                          );
                        }
                      ),                       
                      SizedBox(height: Dimensions.size25),
                      // The ADD button Here 
                      MainButton(
                        text: 'SELL',
                        onPressed: () {                                                    
                          //if unit is not equal to zero 
                          if(unitSoldController.text.trim()=='0' || unitSoldController.text.trim()=='0.0'){
                            UserFeedBack.showError('You cannot sell this product unless you add at least 1 unit of it. Provide a value in the unit section');
                            return;
                          } 

                          if(widget.product.unitAvailable < 1){
                            UserFeedBack.showError('Sorry, you are out of stock');
                            return;
                          }
                          // if form is valid i.e is unit is supplied, then go on to add the product to the Database                    
                          if(sellProdFormKey.currentState!.validate() && soldToFormKey.currentState!.validate()){  
                            if(widget.product.unitAvailable < int.parse(unitSoldController.text.trim())){
                              UserFeedBack.showError('Insufficient number of units available. You cannot sell more than ${widget.product.unitAvailable} items of this product');
                            }else{
                              // getting confirmation from the user
                              UserFeedBack.showConfirmation(
                                onConfirm: (){
                                  Get.back();
                                  // Calling our function for Selling of Product (productController)                                
                                  productController.sellProductItem(
                                    productModel: widget.product, 
                                    unitSold: int.parse(unitSoldController.text.trim()),
                                    soldTo: soldToWhoController.text.trim()
                                  );
                                }, 
                                confirmQuestion: 'You want to go on to sell this product?'
                              );            
                            }                                                                    
                          }                                                       
                        },                         
                      ), 
                      SizedBox(height: Dimensions.size30), 
                    ],
                  ),
                ),
              ),
            ),
            // Extra space at screen end
            SizedBox(height: Dimensions.size50),
          ],
        ),
      ),
    );
  }
}