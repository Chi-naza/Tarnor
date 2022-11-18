import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/custom_widgets/buttons/main_button.dart';
import 'package:tanor/custom_widgets/buttons/tanor_back_button.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/texts/inventory_detail_text_widget.dart';

class InventoryDetailScreen extends StatelessWidget {
  const InventoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(height: Dimensions.size40),
            // item name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Polycap Wire',
                  style: headline3.copyWith(fontWeight: FontWeight.bold, color: AppColors.tarnorFadeTextColor),
                ),
              ),
            ),
            // Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Divider(height: Dimensions.size9, thickness: 2),
            ),
            SizedBox(height: Dimensions.size10),            
            Container(
              padding: EdgeInsets.all(Dimensions.size25),
              color: Colors.white.withOpacity(0.2),
              child: Row(
                children: [
                  // Circular Rating Bar
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: Dimensions.size25*3,
                      lineWidth: Dimensions.size30,
                      percent: 0.75,
                      center: Text('75%', style: headline3.copyWith(letterSpacing: 2)),
                      progressColor: AppColors.mainTextColor1,
                      backgroundColor: AppColors.mainTextColor3,
                      reverse: true,
                      animation: true,
                      animationDuration: 2400,
                    ),
                  ),
                  // column of items beside the circular rating bar
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Income",
                          style: headline5.copyWith(color: AppColors.mainTextColor2),
                        ),
                        SizedBox(height: Dimensions.size5),
                        // Column for total income amount & the green Added Amount
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "11,345,070",
                              style: headline2.copyWith(color: AppColors.mainTextColor3, fontSize: Dimensions.size25, letterSpacing: 1),
                            ),
                            Text(
                              "+331,993",
                              style: headline4.copyWith(color: AppColors.tarnorGreen, letterSpacing: 1),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.size15),
                        // Units available
                        Row(
                          children: [
                             Container(
                              height: Dimensions.size10,
                              width: Dimensions.size10,
                              color: AppColors.mainTextColor1,
                            ),
                            SizedBox(width: Dimensions.size5),
                            Text(
                              '1,993 Units Available',
                              style: headline6, 
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.size10),
                        // Units Sold
                        Row(
                          children: [
                             Container(
                              height: Dimensions.size10,
                              width: Dimensions.size10,
                              color: AppColors.mainTextColor3,
                            ),
                            SizedBox(width: Dimensions.size5),
                            Text(
                              '890 Units Sold',
                              style: headline6, 
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.size10),
            // Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Divider(height: Dimensions.size9, thickness: 2),
            ),
            SizedBox(height: Dimensions.size40),
            // Item Details Here: 1st ROW
            Row(
              children: [
                // product name
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Product name', valueText: 'Polycap Wires')
                ),
                // Material
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Material', valueText: 'Copper')
                ),
                // Length
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Length(M)', valueText: '174'),
                ),
              ],
            ),
            SizedBox(height: Dimensions.size30),
            // Item Details Here: 2nd ROW
            Row(
              children: [
                // Type
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Type', valueText: '1,253,236')
                ),
                // Shape
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Shape', valueText: 'Cylindrical')
                ),
                // Unit
                Expanded(
                  child: InventoryDetailTextWidget(titleText: 'Unit', valueText: '5,200'),
                ),
              ],
            ),
            SizedBox(height: Dimensions.size30),
            // Item Details Here: 3nd ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Size
                InventoryDetailTextWidget(titleText: 'Size', valueText: 'Medium'),
                SizedBox(width: Dimensions.screenWidth*0.2),
                // Shape
                InventoryDetailTextWidget(
                  titleText: 'Colour', 
                  isStar: true,
                ),
              ],
            ),
            // The ReStock Button
            SizedBox(height: Dimensions.size50),
            MainButton(
              onPressed: (){}, 
              text: 'ReStock'
            ),
            SizedBox(height: Dimensions.size30),
            // Back Button
            const TarnorBackButton(),
            SizedBox(height: Dimensions.size50),
          ],
        ),
      ),
    );
  }
}