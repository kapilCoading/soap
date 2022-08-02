import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoader() {
  Widget progressIndicator;
  if (kIsWeb) {
    progressIndicator = CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
    );
  } else {
    progressIndicator = Platform.isAndroid
        ? CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : const CupertinoActivityIndicator(
            radius: 14,
          );
  }

  return Get.dialog(
    Center(child: progressIndicator),
    barrierColor: Colors.black.withOpacity(0.2),
    barrierDismissible: false,
  );
}

closeLoader() {
  Get.back();
}
