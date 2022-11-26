import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/controllers/auth_controller.dart';
import 'package:tanor/controllers/product_controller.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/lists/chart_filter_list.dart';
import 'package:tanor/custom_widgets/lists/product_item_widget.dart';
import 'package:tanor/models/chart_model.dart';
import 'package:tanor/screens/dashboard/admin_total_income.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  bool isChartFilterSelected = false;

  final List<DailyChartModel> dailyChart = [
    DailyChartModel(day: 'Monday', value: 30),
    DailyChartModel(day: 'Tuesday', value: 5),
    DailyChartModel(day: 'Wednesday', value: 90),
    DailyChartModel(day: 'Thursday', value: 50),
    DailyChartModel(day: 'Friday', value: 30)
  ];

  final List<WeeklyChartModel> weeklyChart = [
    WeeklyChartModel(week: '1st Week', value: 67),
    WeeklyChartModel(week: '2nd Week', value: 20),
    WeeklyChartModel(week: '3rd Week', value: 100),
    WeeklyChartModel(week: '4th Week', value: 40),
    WeeklyChartModel(week: '5th Week', value: 80),
  ];

  final List<MonthlyChartModel> monthlyChart = [
    MonthlyChartModel(month: 'Jan', value: 10),
    MonthlyChartModel(month: 'Feb', value: 50),
    MonthlyChartModel(month: 'March', value: 77),
    MonthlyChartModel(month: 'April', value: 30),
    MonthlyChartModel(month: 'June', value: 60),
  ];

  final List<YearlyChartModel> yearlyChart = [
    YearlyChartModel(year: '2017', value: 40),
    YearlyChartModel(year: '2018', value: 60),
    YearlyChartModel(year: '2019', value: 90),
    YearlyChartModel(year: '2020', value: 21),
    YearlyChartModel(year: '2021', value: 59),
  ];


  // instance of product controller
  ProductController _productController = Get.find<ProductController>();

  // instance of auth controller
  var authController = Get.find<AuthController>();

  @override
  void initState() {
    if(authController.currentUserData == null){
      authController.getCurrentUserDetails();
    }
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // checking if data is being fetched, if null, show circularProgressIndicator
      // if not null, check if user has made any sell, 
      body: Obx(() {
          return authController.isLoading.value? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
            child: authController.currentUserData.isStaff? Center(
              child: Container( 
                margin: EdgeInsets.only(top: Dimensions.screenHeight*0.5),           
                child: Text(
                  'Only the Admin can see this screen',
                  style: headline5,
                ),
              ),
            ) : Column(
              children: [
                const HeaderWidget(isSecondHeader: true),
                SizedBox(height: Dimensions.size25),
                Text(
                  "Sales Summary",
                  style: headline4.copyWith(color: AppColors.tarnorTextColor),
                ),
                SizedBox(height: Dimensions.size20),
                // Charts area
                Material(
                  color: AppColors.mainTextColor3.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(Dimensions.size15),            
                  child: SizedBox(
                    width: Dimensions.screenWidth*0.95,
                    height: Dimensions.size100*3,
                    child: Column(
                      children: [
                        // List of Chart filters : daily, weekly, monthly & yearly
                        Container(
                          margin: EdgeInsets.symmetric(vertical: Dimensions.size10),
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
                          height: Dimensions.size30,
                          child: ListView.separated(
                            itemCount: ChartFilterList.chartFilter.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: ((context, index) => SizedBox(width: Dimensions.size5)),
                            itemBuilder: ((context, index) {
                              var filterText = ChartFilterList.chartFilter[index]['filter'];
                              var list = ChartFilterList.chartFilter[index];
                              return ChartFilterList(
                                onTap: (){
                                  setState(() {
                                    // deselecting previoulsy selected filter by setting their booleans to false: 
                                    // Using for loop
                                    for(var a in ChartFilterList.chartFilter){
                                     if(a['selected'] == true){
                                      a['selected'] = false;
                                     } 
                                    }
                                    // Setting the current index to selected True onTap
                                    list['selected'] = !list['selected'];                                
                                  });
                                }, 
                                filterText: filterText, 
                                isSelected: list['selected'],
                              );
                            }), 
                          ),
                        ),
                        // The Bar Chart from SyncFusion 
                        // DAILY
                        if(ChartFilterList.chartFilter[0]['selected'])
                          Expanded(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: [
                                StackedColumnSeries(
                                  borderRadius: BorderRadius.circular(Dimensions.size3),
                                  color: AppColors.mainTextColor3.withOpacity(0.8),
                                  dataSource: dailyChart, 
                                  xValueMapper: (DailyChartModel d, _) => d.day, 
                                  yValueMapper: (DailyChartModel d, _) => d.value,
                                ),
                              ],
                            ),
                          ),
                        // WEEKLY
                        if(ChartFilterList.chartFilter[1]['selected'])
                          Expanded(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: [
                                StackedColumnSeries(
                                  borderRadius: BorderRadius.circular(Dimensions.size3),
                                  color: AppColors.mainTextColor3.withOpacity(0.8),
                                  dataSource: weeklyChart, 
                                  xValueMapper: (WeeklyChartModel w, _) => w.week, 
                                  yValueMapper: (WeeklyChartModel w, _) => w.value,
                                ),
                              ],
                            ),
                          ),
                        // MONTHLY
                        if(ChartFilterList.chartFilter[2]['selected'])
                          Expanded(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: [
                                StackedColumnSeries(
                                  borderRadius: BorderRadius.circular(Dimensions.size3),
                                  color: AppColors.mainTextColor3.withOpacity(0.8),
                                  dataSource: monthlyChart, 
                                  xValueMapper: (MonthlyChartModel m, _) => m.month, 
                                  yValueMapper: (MonthlyChartModel m, _) => m.value,
                                ),
                              ],
                            ),
                          ),
                        // YEARLY
                        if(ChartFilterList.chartFilter[3]['selected'])
                          Expanded(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: [
                                StackedColumnSeries(
                                  borderRadius: BorderRadius.circular(Dimensions.size3),
                                  color: AppColors.mainTextColor3.withOpacity(0.8),
                                  dataSource: yearlyChart, 
                                  xValueMapper: (YearlyChartModel y, _) => y.year, 
                                  yValueMapper: (YearlyChartModel y, _) => y.value,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.size30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.size15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SALES TODAY',
                        style: headline5.copyWith(fontWeight: FontWeight.bold, color: AppColors.tarnorFadeTextColor, letterSpacing: 1),
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
                  child: Divider(height: Dimensions.size9, thickness: 2.5),
                ),
                // LIST OF ALL SALES
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _productController.allSalesDataList.length,     
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>  SizedBox(height: Dimensions.size9),   
                    itemBuilder: (BuildContext, int index){
                      var productSold = _productController.allSalesDataList[index];
                      return  ProductItemWidget(
                        productName: productSold.productName, // name
                        time: '${productSold.time} ',
                        date: productSold.date,
                        price: '+${productSold.totalAmount}',
                        quantity: productSold.unitSold.toString(), // quantity sold
                      );
                    }
                  ),
                ),
                SizedBox(height: Dimensions.size100),
              ],
            ),
          );
        }
      ),
      floatingActionButton: authController.currentUserData.isStaff? null : FloatingActionButton.extended(
        elevation: 3,
        label: Text(
          'See Total Icome',
          style: headline5.copyWith(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.size10)),
        onPressed: (){ 
          Get.to(AdminTotalIcomeScreen());
        },
      ),
    );
  }
}