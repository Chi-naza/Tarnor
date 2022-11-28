import 'package:get/get.dart';
import 'package:tanor/controllers/chart_controller.dart';
import 'package:tanor/screens/auth_screens/employeelogin.dart';
import 'package:tanor/screens/auth_screens/employerlogin.dart';
import 'package:tanor/screens/auth_screens/register_screen.dart';
import 'package:tanor/screens/dashboard/admin.dart';
import 'package:tanor/screens/dashboard/admin_total_income.dart';
import 'package:tanor/screens/home/tarnor_home.dart';
import 'package:tanor/screens/intro/splash_screen.dart';
import 'package:tanor/screens/intro/welcome.dart';
import 'package:tanor/screens/products/add_new_product.dart';
import 'package:tanor/screens/products/sell_a_product.dart';

class Routes {

  static List<GetPage> tarnorRoutes =  [
    // splash screen
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,      
    ),
    // welcome screen
    GetPage(
      name: WelcomeScreen.routeName,
      page: () => const WelcomeScreen(),
      transition: Transition.zoom,      
    ),
    // Home screen
    GetPage(
      name: TanorHomeScreen.routeName,
      page: () => const TanorHomeScreen(),
      transition: Transition.fadeIn,      
    ),
    // employer login screen
    GetPage(
      name: EmployerLoginScreen.routeName,
      page: () => const EmployerLoginScreen(),  
      transition: Transition.fade,    
    ),
    // employee login screen
    GetPage(
      name: EmployeeLoginScreen.routeName,
      page: () => const EmployeeLoginScreen(),
      transition: Transition.fade,      
    ),
    // register screen
    GetPage(
      name: RegisterScreen.routeName,
      page: () => RegisterScreen(),
      transition: Transition.fade,      
    ),
    // Create A New Product
    GetPage(
      name: AddNewProductScreen.routeName,
      page: () => const AddNewProductScreen(),
      transition: Transition.fade,      
    ),
  ];
}