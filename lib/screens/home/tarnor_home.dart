import 'package:flutter/material.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/screens/dashboard/admin.dart';
import 'package:tanor/screens/dashboard/staff_list_screen.dart';
import 'package:tanor/screens/products/inventory_list_screen.dart';
import 'package:tanor/screens/settings_screen.dart';

class TanorHomeScreen extends StatefulWidget {
  const TanorHomeScreen({ Key? key }) : super(key: key);

  static const String routeName = '/home';

  @override
  State<TanorHomeScreen> createState() => _TanorHomeScreenState();
}
   
class _TanorHomeScreenState extends State<TanorHomeScreen> {

  int pageIndex = 1;

  List pages = [
    const AdminScreen(),
    const InventoryListScreen(),
    const StaffListScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.tarnorTextColor,
        selectedItemColor: AppColors.mainColor,
        selectedLabelStyle: headline5,
        currentIndex: pageIndex,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stacked_line_chart_rounded,
            ),
            label: "Sales summary",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spoke_outlined),
            label: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_rounded),
            label: "Staff Management",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined),
            label: "Settings",
          ),
        ],
      ),
    );

  }

}