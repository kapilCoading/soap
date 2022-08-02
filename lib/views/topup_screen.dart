import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/utils/apptext_field.dart';
import 'package:souapp/views/startdate_screen.dart';

import '../controllers/get_plan_controller.dart';
import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';
import '../utils/envelop_button.dart';

class TopUpScreen extends StatelessWidget {
  TopUpScreen({Key? key}) : super(key: key);

  var con = Get.put(GetPlanController());
  final numList = [
    "\$ 50",
    "\$ 100",
    "\$ 150",
    "\$ 200",
    "\$ 250",
    "\$ 300",
    "Other",
    "No Increase"
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.43),
              child: Container(
                height: Get.height * 0.55,
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
                        children: const [
                          Text(
                            'TopUp Amount',
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
                        height: Get.height * 0.007,
                      ),
                      SizedBox(
                        width: Get.width * 0.55,
                        child: Text(
                          'topup increases by this amount daily',
                          strutStyle: StrutStyle(height: 1.3),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
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
                                  con.setTopUp = numList[index];
                                },
                                containerWidth:
                                    numList[index].length.toDouble() * 12.5,
                                title: numList[index],
                                envelopColor: (numList[index] == con.getTopUp)
                                    ? AppColors.orange
                                    : AppColors.white,
                                textColor: (numList[index] == con.getTopUp)
                                    ? AppColors.white
                                    : AppColors.lightblack);
                          }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      Text(
                        'Preferred Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.006,
                      ),
                      AppTextField(
                          hintText: "enter amount",
                          labelText: "25",
                          controller: null),
                      // Container(
                      //   height: Get.height * 0.058,
                      //   width: Get.width * 0.93,
                      //   padding: EdgeInsets.only(
                      //       left: Get.width * 0.02, top: Get.height * 0.014),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(7),
                      //       color: AppColors.filledcolor,
                      //       border: Border.all(color: AppColors.textblack)),
                      //   child: Text('25'),
                      // ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      AppButton(
                          buttonName: AppStrings.next,
                          onTap: () {
                            Get.to(() => StartDateScreen());
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
            ),
          )
        ],
      ),
    ));
  }
}
