import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_dimensions.dart';

class myThemes {
  ThemeData mytheme = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: 'Georgia',
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     padding: EdgeInsets.symmetric(horizontal: Dimensions.size40, vertical: Dimensions.size15),
    //     backgroundColor: Color(0xff600091), // background (button) color
    //     foregroundColor: Colors.white, // foreground (text) color
    //     shadowColor: Colors.deepPurple,
    //     elevation: 3.00,
    //     minimumSize: Size(Dimensions.size50, Dimensions.size7),
    //     textStyle: TextStyle(
    //       fontSize: Dimensions.size20,
    //       fontWeight: FontWeight.bold,
    //       fontFamily: "Georgia"),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Dimensions.size9),
    //     )
    //   ),
    // ),

    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: Dimensions.size3,
        fontFamily: "",
        fontWeight: FontWeight.bold,
        letterSpacing: 3.00,
        wordSpacing: 2.00,
      ),
      headline2:
        TextStyle(
          fontSize: Dimensions.size20, 
          fontStyle: FontStyle.italic,
        ),
      headline3: TextStyle(
        fontSize: Dimensions.size18,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        color: Color(0xff4E4E4E),
      ),
      headline4: TextStyle(
        fontSize: Dimensions.size16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        // color: Color(0xff69069C),
      ),
      headline5: TextStyle(
          fontSize: Dimensions.size12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal,
          color: Color(0xff4E4E4E)),
      headline6: TextStyle(
        color: Color(0xff8F8F8F),
        fontFamily: "Montserrat",
        fontSize: Dimensions.size10,
        fontWeight: FontWeight.w500,
      ),
      // bodyText1:
      //     const TextStyle(fontSize: 36.00, fontStyle: FontStyle.italic),
      // bodyText2: const TextStyle(
      //     fontSize: 36.00,
      //     fontStyle: FontStyle.italic,
      //     fontWeight: FontWeight.bold
      //   ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.size12)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.size12)
        ),
        filled: true,
        fillColor: Color(0xffE5E5E5),
        hintStyle: TextStyle(
          backgroundColor: Colors.white38,
          color: Color(0xff600091),
          fontFamily: "Georgia",
          fontSize: Dimensions.size20,
          fontWeight: FontWeight.normal,
        ),
        errorStyle: TextStyle(
          backgroundColor: Colors.white,
          color: Colors.red,
          fontFamily: "Georgia",
          fontSize: Dimensions.size14,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        helperStyle: TextStyle(
          backgroundColor: Colors.white,
          color: Color(0xff600091),
          fontFamily: "Georgia",
          fontSize: Dimensions.size5,
          fontWeight: FontWeight.bold,
        ),
        labelStyle: TextStyle(
          color: Color(0xff8F8F8F),
          fontFamily: "Montserrat",
          fontSize: Dimensions.size18,
          fontWeight: FontWeight.w500,
        ),
        hoverColor: Colors.amber,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2.00,
          ),
        ),
      ),
  );
}
