import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/utils/envelop_button.dart';
import 'package:souapp/views/startingamount_screen.dart';

import '../controllers/get_plan_controller.dart';
import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class FrequencyScreen extends StatelessWidget {
  FrequencyScreen({Key? key}) : super(key: key);
  var con = Get.put(GetPlanController());
  final numList = [
    "Daily",
    "Weekly",
    "Twice a week",
    "Monthly",
    "One in a week",
    "Twice a Month"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundblue,
      body: Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
          Positioned(
              top: Get.height * 0.08,
              left: Get.width * 0.2,
              child: Image.asset('assets/images/Saly-45.png')),
          Positioned(
              top: Get.height * 0.05,
              left: Get.width * 0.87,
              child: Image.asset('assets/images/vector2.png')),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.43),
            child: Container(
              height: Get.height * 0.75,
              width: Get.width * 0.999,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, right: Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.027,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Savings Frequency',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.textblue),
                        ),
                        Text(
                          '1/2',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.textblue),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Obx(
                      () => Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: List.generate(numList.length, (index) {
                          return EnvelopButton(
                              onTap: () {
                                con.setFrequency = numList[index];
                              },
                              containerWidth:
                                  numList[index].length.toDouble() * 11.5,
                              title: numList[index],
                              envelopColor: (numList[index] == con.getFrequency)
                                  ? AppColors.orange
                                  : AppColors.white,
                              textColor: (numList[index] == con.getFrequency)
                                  ? AppColors.white
                                  : AppColors.lightblack);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                      height: Get.height * 0.19,
                    ),
                    AppButton(
                        buttonName: AppStrings.next,
                        onTap: () {
                          Get.to(() => StartingAmountScreen());
                        },
                        isIconShow: false,
                        height: Get.height * 0.071,
                        fontSize: 18,
                        fontweight: FontWeight.w600,
                        width: Get.width * 0.93,
                        backgroundColor: AppColors.orange,
                        //iconColor: AppColors.bluishBlack,
                        textColor: Color(0xffFFFFFF)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
