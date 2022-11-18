import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/lists/inventory_item_card.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';

class InventoryListScreen extends StatelessWidget {
  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const TextnDividerHeader(text: 'My Inventory', wantDivider: false),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: headline5.copyWith(fontWeight: FontWeight.bold, color: AppColors.tarnorFadeTextColor),
                  ),
                  // Row for Sort
                  Row(
                    children: [
                      Text(
                        'Sort',
                        style: headline5.copyWith(fontWeight: FontWeight.bold, color: AppColors.tarnorFadeTextColor),
                      ),
                      SizedBox(width: Dimensions.size3),
                      Icon(
                        Icons.sync_alt_outlined,
                        size: Dimensions.size18,
                        color: AppColors.tarnorFadeTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Divider(height: Dimensions.size9, thickness: 2),
            ),
            SizedBox(height: Dimensions.size20),
            // Horizontal LIST of CARDS
            Container( 
              height: Dimensions.size25*3,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: ListView.separated(
                itemCount: 8,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: Dimensions.size5),
                itemBuilder: (context, index) {
                  return const InventoryItemCard(
                    itemName: 'Wires', 
                    quantity: '1,115',
                  );
                },
              ),
            ),
            SizedBox(height: Dimensions.size20),
            // Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
              child: Divider(height: Dimensions.size9, thickness: 2),
            ),
            // Expandable and Collapsable Widget
            ListView.separated(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
                      child: Divider(height: Dimensions.size9, thickness: 1),
                    ),
                    SizedBox(height: Dimensions.size5),
                  ],
                );
              },
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    'Bulbs',
                    style: headline4.copyWith(color: AppColors.tarnorTextColor),
                  ),
                  children: List.generate(4, (index) {
                    return ListTile(
                      title: Text('Wire and bulb that is new'),
                      onTap: (){},
                    );
                  }),
                );
              },
            ),
            // extra space at the screen end
            SizedBox(height: Dimensions.size60)           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        child: const Icon(Icons.add),
        onPressed: (){ 
          print("Added Item");
        },
      ),
    );
  }
}