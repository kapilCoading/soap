import 'package:flutter/material.dart';

import 'package:souapp/utils/appcolors_theme.dart';

class EnvelopButton extends StatelessWidget {
  final Function() onTap;

  final String title;

  final Color envelopColor;

  final double containerWidth;

  final Color textColor;
  const EnvelopButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.envelopColor,
      required this.containerWidth,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: double.minPositive),
          // margin: const EdgeInsets.only(left: 10),
          width: containerWidth,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: AppColors.fadegrey,
                    blurRadius: 4,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer),
              ],
              borderRadius: BorderRadius.circular(20),
              color: envelopColor,
              border: Border.all(width: 1, color: AppColors.textblue)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
          ),
        ));
  }
}
