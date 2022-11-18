import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/custom_widgets/buttons/tanor_back_button.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/custom_widgets/texts/text_title_value_widget.dart';

class StaffDetailScreen extends StatelessWidget {
  const StaffDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const TextnDividerHeader(text: 'My Staff'),
            // Staff Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size20, vertical: Dimensions.size30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ekenedilichukwu',
                      style: headline2.copyWith(fontSize: Dimensions.size30, color: AppColors.tarnorFadeTextColor),
                    ),
                  ),
                  SizedBox(height: Dimensions.size20),
                  // Staff Other Info
                  TitleAndValueWidget(title: 'E-mail', value: 'ekenedilichukwu@gmail.com'),
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Date Employed', value: '7th November, 2022'),
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Address', value: 'Onuiyi Nsukka'),
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Total Sales', value: '308'),
                  SizedBox(height: Dimensions.size30),
                  const TarnorBackButton(),
                  SizedBox(height: Dimensions.size30), // space at screen end
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}