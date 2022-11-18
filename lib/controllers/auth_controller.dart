import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanor/models/user_model.dart';
import 'package:tanor/screens/auth_screens/employeelogin.dart';
import 'package:tanor/screens/home/tarnor_home.dart';
import 'package:tanor/screens/intro/welcome.dart';
import 'package:tanor/utilities/feedback.dart';
import 'package:tanor/utilities/firebase_references.dart';
import 'package:tanor/utilities/logger.dart';

class AuthController extends GetxController {
  late FirebaseAuth auth;

  Rxn<User> user = Rxn<User>();

  late Stream<User?> authStateChanges;



  @override
  void onReady() {
    startUpAuth();
    super.onReady();
  }


  Future<void> startUpAuth() async {
    await Future.delayed(const Duration(seconds: 4));
    auth = FirebaseAuth.instance;
    authStateChanges = auth.authStateChanges();

    // listen to changes
    authStateChanges.listen((User? currentUser) { 
      user.value = currentUser;
    });

    // Go to homeScreen or WelcomeScreen when app starts
    if(isUserLoggedIn()){
      goToHomeScreen();
    }else{
      Get.offAllNamed(WelcomeScreen.routeName);
    }
  }


  
  bool isUserLoggedIn(){
    return auth.currentUser != null;
  }


  void goToHomeScreen(){
    Get.offAllNamed(TanorHomeScreen.routeName);
  }


  void goToLoginScreen(){
    Get.offAllNamed(EmployeeLoginScreen.routeName);
  }


  // A function which returns the currently loggedIn user. 
  // And we can then access the user's details
  User? getCurrentUser(){
    user.value = auth.currentUser;
    return user.value;
  }



  // A function which registers  a user when called
  Future<void> signUpUser(String email, String password, String fName, String lName) async{
    try{
      // start Loading
      UserFeedBack.showLoading();
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 3));
      // save user details in the Database
      await saveUserInFireStore(email, fName, lName);
      // show success feedback
      UserFeedBack.showSuccess('Registration successful!');
      await Future.delayed(Duration(seconds: 2));
      goToHomeScreen();
    }on FirebaseAuthException catch(e){
      AppLogger.e(e);
      Get.back();
      UserFeedBack.showError(e.message!);
    }
  }

  // A function which logs In a user when called
  Future<void> signInUser(String email, String password) async{
    try{
      // start Loading
      UserFeedBack.showLoading();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // show success feedback
      UserFeedBack.showSuccess('You have successfully logged In!');
      await Future.delayed(Duration(seconds: 2));
      goToHomeScreen();
    }on FirebaseAuthException catch(e){
      AppLogger.e(e);
      Get.back();
      UserFeedBack.showError(e.message!);
    }

  }



  // A function which logs Out a user when called
  Future<void> signOutUser() async{
    try{
      await auth.signOut();
      print("Logout Successful !");
      UserFeedBack.showSuccess('Logout Successful !');
      await Future.delayed(Duration(seconds: 2));
      goToLoginScreen();
    }catch (e){
      AppLogger.e(e);
    }
  }




  // Function which creates a user in the fireStore DB when registration is done
  Future<void> saveUserInFireStore(String email, String fn, String ln) async {
    UserModel userModel = UserModel(
      firstName: fn, 
      surname: ln, 
      email: email, 
      isStaff: true, 
      phoneNumber: '', 
      position: '', 
      dateEmployed: DateFormat.yMMMMEEEEd().format(DateTime.now()),
      imageUrl: '',
      mySales: [],
    );

    // serializing it to Json and sending it to user collection in fireStore
    await userFirestoreReference.doc(email).set(userModel.toJson());
    print('Saved in FireStore');

  }






}