// import 'package:firebase_auth/firebase_auth.dart';

// class AuthenticationHelper {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user => _auth.currentUser;
  

 //SIGN UP METHOD
  // Future signUp({required String email, required String password}) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // return AuthResult;
  //   }  catch (e) {
  //     return e;
  //   }
  // }

  //SIGN IN METHOD
//   Future signIn({required String email, required String password}) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return null;
//     } catch (e) {
//       return e;
//     }
//   }

//   //SIGN OUT METHOD
//   Future signOut() async {
//     await _auth.signOut();

//     print('signout');
//   }
// }