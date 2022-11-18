import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tanor/controllers/auth_controller.dart';
import 'package:tanor/models/product_model.dart';
import 'package:tanor/screens/products/add_new_product.dart';
import 'package:tanor/utilities/feedback.dart';
import 'package:tanor/utilities/firebase_references.dart';
import 'package:tanor/utilities/logger.dart';

class ProductController extends GetxController{

  @override
  void onReady() {
    // getAllProducts();
    super.onReady();
  }

  AuthController _authController = Get.find<AuthController>();


  // A function which gets all the products in the inventory
  Future<void> getAllProducts() async {
    try{
      QuerySnapshot<Map<String, dynamic>> productData = await productFirestoreReference.get();
    }catch (e){
      AppLogger.e(e);
    }
  }



  // A function which creates a product when it is called
  Future<void> createProductItem(ProductModel product) async {
    try{
      UserFeedBack.showLoading();
      await productFirestoreReference.doc(product.name.toUpperCase()).set(product.toJson());
      UserFeedBack.showSuccess('Product has been added successfully !');
      // delay and go to home
      await Future.delayed(const Duration(seconds: 3));
      _authController.goToHomeScreen();
    }catch (e){
      AppLogger.e(e);
      Get.back();
      UserFeedBack.showError('Product Creation Failed. Try Again !');
    }
  }


  // Sell a product
  void sellProductItem(){
    try{

      UserFeedBack.showSuccess('Product has been added to sales !');
      // delay and go to home
      Future.delayed(const Duration(seconds: 2));
      _authController.goToHomeScreen();
    }catch (e){
      AppLogger.e(e);
      Get.back();
      UserFeedBack.showError('Product Creation Failed. Try Again !');
      Get.to(() => const AddNewProductScreen());
    }
  }


}