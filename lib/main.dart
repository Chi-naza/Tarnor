import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanor/app_constants/routes.dart';
import 'package:tanor/bindings/custom_bindings.dart';
import 'package:tanor/firebase_options.dart';
import 'package:tanor/screens/home/tarnor_home.dart';
import 'package:tanor/screens/products/add_new_product.dart';
import 'themes/mytheme.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CustomAppBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp()); 
}




class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(   
      theme: myThemes().mytheme,
      getPages: Routes.tarnorRoutes,
      // home: AddNewProductScreen(),
    );
  }
}