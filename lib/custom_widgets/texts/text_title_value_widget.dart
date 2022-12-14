import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';

class TitleAndValueWidget extends StatelessWidget {
  final String title;
  final String value;
  
  const TitleAndValueWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [                     
        //title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: headline3.copyWith(color: AppColors.mainTextColor3, letterSpacing: 1),
          ),
        ),
        SizedBox(height: Dimensions.size5),
        // value
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: headline5.copyWith(letterSpacing: 1),
          ),
        ),
      ],
    );
  }
}