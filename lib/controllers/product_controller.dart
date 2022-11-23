import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanor/controllers/auth_controller.dart';
import 'package:tanor/models/product_model.dart';
import 'package:tanor/models/sales_model.dart';
import 'package:tanor/utilities/feedback.dart';
import 'package:tanor/utilities/firebase_references.dart';
import 'package:tanor/utilities/logger.dart';

class ProductController extends GetxController{

  final allProductsList = <ProductModel>[].obs;
  final allSalesDataList = <SalesModel>[].obs;
  final currentUserSalesList = <SalesModel>[].obs;


  // For sell of product
  final myDate = ''.obs;
  final myTime = ''.obs;
  final sellProductTotalAmount = 0.0.obs;

  @override
  void onReady() {
    getAllProducts();
    getAllSalesData();
    super.onReady();
  }

  AuthController _authController = Get.find<AuthController>();


  // A function which gets all the products in the inventory
  Future<void> getAllProducts() async {
    try{
      QuerySnapshot<Map<String, dynamic>> productData = await productFirestoreReference.get();
      var products = productData.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      allProductsList.assignAll(products);
      print('PRODUCTS GOTTEN  (success) $allProductsList');
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




  // A function which Sells a product
  Future<void> sellProductItem({required ProductModel productModel, required int unitSold}) async {
    DateTime currentDateTime = DateTime.now();
    String productName = productModel.name.toUpperCase();
    try{
      UserFeedBack.showLoading();
      // Creating an object of the Sales Model
      SalesModel salesModel = SalesModel(
        product: productModel.toJson(), 
        whoSoldIt: _authController.getCurrentUser()!.email!, 
        unitSold: unitSold, 
        totalAmount: sellProductTotalAmount.value.toString(), 
        productName: productModel.name,
        time: myTime.value, 
        date: myDate.value,
        dateCreated: currentDateTime
      );
      // Save sales info to the general sales collection in the DB
      await salesFirestoreReference.doc("$productName : $currentDateTime").set(salesModel.toJson());
      // little delay before the next operation
      await Future.delayed(const Duration(seconds: 1));
      // Save current user's sales to the user data in the DB
      await userFirestoreReference.doc(_authController.getCurrentUser()!.email).collection('mySales').doc("$productName : $currentDateTime").set(salesModel.toJson());
      // Update the units(quantity) of the product
      updateUnitsOfProducts(productModel, unitSold);
      // little delay before getting updated products from our DB
      await Future.delayed(const Duration(seconds: 1));
      getAllProducts();
      // little delay before getting sales Data
      await Future.delayed(const Duration(seconds: 1));
      getAllSalesData();


      UserFeedBack.showSuccess('Product has been added to sales !');
      // delay and go to home
      await Future.delayed(const Duration(seconds: 2));
      _authController.goToHomeScreen();
    }catch (e){
      AppLogger.e(e);
      Get.back();
      UserFeedBack.showError('Failed to add product to sales. Try Again !');
    }
  }





  // A function which updates key variables during sell of a product
  void updateProductSellVariables(double unit, double amount){

    myDate.value = DateFormat('yMd').format(DateTime.now());
    myTime.value = DateFormat.jm().format(DateTime.now());

    sellProductTotalAmount.value = unit*amount;
    print('UNIT: $unit and AMOUNT: $amount'); // testing

  }



  // A function which updates the units (quantities) of the product being sold
  Future<void> updateUnitsOfProducts(ProductModel product, int unitSold) async {
    try{
      // Get a specific product (that which is being sold)
      DocumentSnapshot<Map<String, dynamic>> data =  await productFirestoreReference.doc(product.name.toUpperCase()).get();
      // updating the units of the sold product data gotten
      data.reference.update(
        {
          'unit_sold' : product.unitSold += unitSold,
          'unit_available' : product.unitAvailable - unitSold,
        }
      );
    }catch(e){
      AppLogger.e(e);
    }
  }



  // A function which gets all the sales made
  void getAllSalesData() async {
    try{
      QuerySnapshot<Map<String, dynamic>> salesData = await salesFirestoreReference.get();
      var sales = salesData.docs.map((e) => SalesModel.fromSnapshot(e)).toList();
      allSalesDataList.assignAll(sales);
      print('SALES GOTTEN  (success) $allSalesDataList');
    }catch (e){
      AppLogger.e(e);
    }
  }



  
  // A function which restocks the a product that is out of stock
  Future<void> restockProduct(ProductModel product, int addedUnit) async {
    try{
      // start loading as request is being processed
      UserFeedBack.showLoading();
      // Get a specific product
      DocumentSnapshot<Map<String, dynamic>> data =  await productFirestoreReference.doc(product.name.toUpperCase()).get();
      // updating the units of the product
      await data.reference.update(
        {
          'unit' : addedUnit + product.unitAvailable,
          'unit_available' : product.unitAvailable + addedUnit,
        }
      );
      // little delay before getting updated products from our DB
      await Future.delayed(const Duration(seconds: 1));
      getAllProducts();

      UserFeedBack.showSuccess('Product successfully restocked !');
      // delay and go to home
      await Future.delayed(const Duration(seconds: 2));
      _authController.goToHomeScreen();
    }catch (e){
      AppLogger.e(e);
      Get.back();
     UserFeedBack.showError('Restock operation failed. Try Again !'); 
    }
  }




}