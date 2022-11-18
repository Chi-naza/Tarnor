import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/custom_widgets/inputs/input_field_plus_text.dart';
import 'package:tanor/custom_widgets/buttons/main_button.dart';

class SellAProduct extends StatefulWidget {
  const SellAProduct({Key? key}) : super(key: key);

  @override
  State<SellAProduct> createState() => _SellAProductState();
}

class _SellAProductState extends State<SellAProduct> {

  TextEditingController productNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController shapeController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController lengthController = TextEditingController();

  // For DropDowns
  var selectCategoryList = ['Builder', 'Wire', 'Painter', 'Cutter'];
  String categoryFirstItem = 'Builder';

  var selectColorList = ['White', 'Yellow', 'Green', 'Black'];
  String colorListFirstItem = 'White';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            const HeaderWidget(),
            const TextnDividerHeader(text: 'New Sale Entry', wantDivider: false),
            // The form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Material(
                elevation: 4,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.size15), 
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.size5, vertical: Dimensions.size20),
                  child: Form(
                    child: Column(
                      children: [
                        // productName & Amount,  
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Product Name', textController: productNameController),
                            ),
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Amount', textController: amountController),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.size15),
                        //INPUT with DROPDOWN: 
                        // Select Category
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     // The Text Above the  Dropdown: CATEGORY
                                    const Text(
                                      'Select Category',
                                      style: TextStyle(
                                        color: AppColors.mainTextColor3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.size10),
                                    Container(        
                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.size25),                          
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.size12),
                                        color: AppColors.inputFillColor,
                                      ),                                  
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: Dimensions.size12),
                                        // Wrapping dropdown button widget with this: to remove the persitent underline
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(                            
                                            isExpanded: false,
                                            icon: Icon(Icons.arrow_drop_down, size: Dimensions.size25),  
                                            value: categoryFirstItem,
                                            items: selectCategoryList.map((e) {
                                              return DropdownMenuItem(value: e, child: Text(e));
                                            }).toList(), 
                                            onChanged: (String? newValue){
                                              setState(() {
                                                categoryFirstItem= newValue!;
                                              });
                                            },
                                            style: const TextStyle(color: AppColors.tarnorTextColor),                                      
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: Dimensions.size10),
                              // SELECT COLOR
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     // The Text Above the  Dropdown: COLOR
                                    const Text(
                                      'Color',
                                      style: TextStyle(
                                        color: AppColors.mainTextColor3,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.size10),
                                    Container(        
                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.size25),                              
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.size12),
                                        color: AppColors.inputFillColor,
                                      ),                                  
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: Dimensions.size12),
                                        // Wrapping dropdown button widget with this: to remove the persitent underline
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(                            
                                            isExpanded: false,
                                            icon: Icon(Icons.arrow_drop_down, size: Dimensions.size25),  
                                            value: colorListFirstItem,
                                            items: selectColorList.map((e) {
                                              return DropdownMenuItem(value: e, child: Text(e));
                                            }).toList(), 
                                            onChanged: (String? newValue){
                                              setState(() {
                                                colorListFirstItem = newValue!;
                                              });
                                            },
                                            style: const TextStyle(color: AppColors.tarnorTextColor),                                      
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.size15),
                        // Unit & Shape 
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Unit', textController: unitController, isItForNumber: true),
                            ),
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Shape', textController: shapeController),
                            ),
                          ],
                        ),              
                        SizedBox(height: Dimensions.size15),
                        // Size & Type
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Size', textController: sizeController),
                            ),
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Type', textController: typeController),
                            ),
                          ],
                        ),  
                        SizedBox(height: Dimensions.size15),            
                        // Size & Type
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Size', textController: sizeController),
                            ),
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Type', textController: typeController),
                            ),
                          ],
                        ), 
                        SizedBox(height: Dimensions.size15),             
                        // Material & Length
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Material', textController: materialController),
                            ),
                            Expanded(
                              child: InputFieldPlusTextWidget(text: 'Length', textController: lengthController),
                            ),
                          ],
                        ), 
                        SizedBox(height: Dimensions.size25),
                        // The ADD button Here 
                        MainButton(
                          text: 'SELL',
                          onPressed: () {
                            print('Sell A Product');
                          },                         
                        ), 
                        SizedBox(height: Dimensions.size30),        
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Extra space at screen end
            SizedBox(height: Dimensions.size50),
          ],
        ),
      ),
    );
  }
}