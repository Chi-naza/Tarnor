import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tanor/app_constants/app_colors.dart';
import 'package:tanor/app_constants/app_dimensions.dart';
import 'package:tanor/app_constants/custom_text_styles.dart';
import 'package:tanor/custom_widgets/header/header_widget.dart';
import 'package:tanor/custom_widgets/lists/chart_filter_list.dart';
import 'package:tanor/custom_widgets/lists/product_item_widget.dart';
import 'package:tanor/models/chart_model.dart';

class AdminTotalIcomeScreen extends StatefulWidget {
  AdminTotalIcomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminTotalIcomeScreen> createState() => _AdminTotalIcomeScreenState();
}

class _AdminTotalIcomeScreenState extends State<AdminTotalIcomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(height: Dimensions.size25),
            Column(
              children: [
                Text(
                  "Total Income",
                  style: headline4.copyWith(color: AppColors.mainTextColor2),
                ),
                SizedBox(height: Dimensions.size5),
                // Column for total income amount & the green Added Amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "11,345,070",
                      style: headline1.copyWith(color: AppColors.mainTextColor2, letterSpacing: 1),
                    ),
                    Text(
                      "+331,993",
                      style: headline3.copyWith(color: AppColors.tarnorGreen, letterSpacing: 1),
                    ),
                  ],
                ),
              ],
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sales',
                  style: headline4.copyWith(fontWeight: FontWeight.bold, color: AppColors.tarnorFadeTextColor, letterSpacing: 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size10),
              child: Divider(height: Dimensions.size9, thickness: 2.5),
            ),
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 10,     
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>  SizedBox(height: Dimensions.size9),   
                itemBuilder: (BuildContext, int index){
                  return  const ProductItemWidget(
                    productName: 'POLYCARD WIRE',
                    time: '12:05:02pm ',
                    date: '3 Nov 2022',
                    price: '+5,070',
                    quantity: '4 Meters',
                  );
                }
              ),
            ),
            SizedBox(height: Dimensions.size30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.size10)),
        onPressed: (){ 
          print("pressed floating action button");
        },
      ),
      // bottomNavigationBar: const TanorBottomNavBar(),
    );
  }
}