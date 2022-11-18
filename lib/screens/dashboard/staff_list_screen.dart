import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/custom_widgets/lists/staff_row_widget.dart';
import 'package:tanor/custom_widgets/texts/text_n_divider_header.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';

class StaffListScreen extends StatelessWidget {
  const StaffListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const TextnDividerHeader(text: 'My Staff'),
            // List of Staff
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                itemCount: 7,
                shrinkWrap: true,
                separatorBuilder: ((context, index) {
                  return Column(
                    children: [
                      SizedBox(height: Dimensions.size3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.size20),
                        child: Divider(height: Dimensions.size9, thickness: 1),
                      ),
                    ],
                  );
                }),
                itemBuilder: ((context, index) {
                  return  InkWell(
                    onTap: (){},
                    child: StaffRowWidget(text: 'John Nano'),
                  );
                })
              ),
            ),           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        child: const Icon(Icons.add),
        onPressed: (){ 
          print("Added Staff");
        },
      ),
    );
  }
}