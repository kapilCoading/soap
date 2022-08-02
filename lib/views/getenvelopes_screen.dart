import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/get_plan_controller.dart';
import 'package:souapp/utils/envelop_button.dart';
import 'package:souapp/views/frequency_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';
import '../utils/apptext_field.dart';

class GetEnvelopesScreen extends StatefulWidget {
  const GetEnvelopesScreen({Key? key}) : super(key: key);

  @override
  State<GetEnvelopesScreen> createState() => _GetEnvelopesScreenState();
}

class _GetEnvelopesScreenState extends State<GetEnvelopesScreen> {
  var con = Get.put(GetPlanController());
  final numList = [
    "30 Envelopes",
    "130 Envelopes",
    "150 Envelopes",
    "200 Envelopes",
    "Other"
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
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
          Positioned(
            top: Get.height * 0.08,
            left: Get.width * 0.2,
            child: Image.asset(
              'assets/images/Saly-45.png',
            ),
          ),
          Positioned(
            top: Get.height * 0.05,
            left: Get.width * 0.87,
            child: Image.asset(
              'assets/images/vector2.png',
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.43),
              child: Container(
                height: Get.height * 0.75,
                width: Get.width * 0.999,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(
                      40.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.04, right: Get.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Get.height * 0.027,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Get Envelopes',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.textblue,
                            ),
                          ),
                          Text(
                            '1/2',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.textblue,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Obx(
                        () => Wrap(
                          runSpacing: 10,
                          spacing: 8,
                          children: List.generate(numList.length, (index) {
                            return EnvelopButton(
                                onTap: () {
                                  con.setEnvelop = numList[index];
                                },
                                containerWidth:
                                    numList[index].length.toDouble() * 11.5,
                                title: numList[index],
                                envelopColor: (numList[index] == con.getEnvelop)
                                    ? AppColors.orange
                                    : AppColors.white,
                                textColor: (numList[index] == con.getEnvelop)
                                    ? AppColors.white
                                    : AppColors.lightblack);
                          }),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      // SizedBox(
                      //   height: Get.height * 0.04,
                      // ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Preferred Amount (\$)",
                        ),
                        controller: con.prefredAmount,
                      ),
                      // SizedBox(
                      //   height: Get.height * 0.006,
                      // ),
                      Container(
                          // height: Get.height * 0.058,
                          // width: Get.width * 0.93,
                          // padding: EdgeInsets.only(
                          //     left: Get.width * 0.02, top: Get.height * 0.014),
                          // decoration: BoxDecoration(
                          //     color: AppColors.filledcolor,
                          //     border: Border.all(color: AppColors.textblack)),
                          child: const AppTextField(
                        controller: null,
                        labelText: "set amount",
                        hintText: "",
                      )),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      AppButton(
                          buttonName: AppStrings.next,
                          onTap: () {
                            Get.to(() => FrequencyScreen());
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
