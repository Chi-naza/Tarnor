import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/custom_widgets/buttons/tanor_back_button.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/custom_widgets/texts/text_title_value_widget.dart';
import 'package:tanor/models/user_model.dart';
import 'package:tanor/screens/dashboard/specific_staff_sales.dart';

class StaffDetailScreen extends StatelessWidget {
  final UserModel staff;
  
  const StaffDetailScreen({Key? key, required this.staff}) : super(key: key);

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
                      staff.firstName, // staff name
                      style: headline2.copyWith(fontSize: Dimensions.size30, color: AppColors.tarnorFadeTextColor),
                    ),
                  ),
                  SizedBox(height: Dimensions.size20),
                  // Staff Other Info
                  TitleAndValueWidget(title: 'E-mail', value: staff.email), // email
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Date Employed', value: staff.dateEmployed), // date employed
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Position', value: staff.position),  // position
                  SizedBox(height: Dimensions.size14),
                  TitleAndValueWidget(title: 'Total Sales', value: staff.mySales.length.toString()), // total sales
                  SizedBox(height: Dimensions.size14),
                  // See sales button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: (){
                        if(staff.mySales.isNotEmpty){
                          Get.to(SpecificStaffSalesScreen(specificStaff: staff));
                        }
                      }, 
                      child: Text(
                        staff.mySales.isNotEmpty? 'See Sales' : 'No Sales',
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.size14,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
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