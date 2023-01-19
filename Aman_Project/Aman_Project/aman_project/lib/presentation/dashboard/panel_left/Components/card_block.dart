import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/chart_data.dart';
import '../../../shared_features/custom_loading_screen.dart';
import 'dash_board_card.dart';

class CardBlock extends StatefulWidget {
  final double? width;

  final int dataNum;

  const CardBlock({super.key, this.width, this.dataNum = 0});

  @override
  State<CardBlock> createState() => _CardBlockState();
}

class _CardBlockState extends State<CardBlock> {
  Future<List<ChartData>>? chartData;
  int widgetIcon = 0xf7f5;
  String widgetText = "Units".tr;
  @override
  void initState() {
    super.initState();
    if (widget.dataNum == 0) {
      chartData = PropertyManagement.getPropertiesType();
    } else if (widget.dataNum == 1) {
      widgetIcon = 0xeb93;
      widgetText = "Users".tr;
      chartData = UserHelper.getUsersRoles();
    } else if (widget.dataNum == 2) {
      chartData = RentsManagement.getRentsType();
      widgetIcon = 0xf0624;
      widgetText = "Rents".tr;
    } else {
      chartData = PropertyManagement.getPropertiesType();
    }
  }

  bool onend = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = widget.width ?? MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (!isExpanded) {
            onend = false;
          }
        });
      },
      // Future bulider to get the chart data from firebase cached
      child: FutureBuilder(
        future: chartData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              width: widgetWidth,
              height: !isExpanded ? widgetWidth * 0.4 : widgetWidth * 1.2,
              onEnd: () {
                setState(() {
                  onend = isExpanded;
                });
              },
              //rebuilding the card with apropriate width on tap
              child: DashboardCard(
                expand: onend,
                chartData: snapshot.data,
                text: widgetText,
                icon: widgetIcon,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: const [
                  Center(
                    child: LoadingScreen(),
                  ),
                  Text("Loading Block")
                ],
              ),
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}
