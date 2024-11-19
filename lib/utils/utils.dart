import 'package:carbon_intensity_project/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

// Toast Message
  static toastMessage(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.blackColor);
  }

// snackBar message
  static snackBarMessage(String title, String msg) {
    Get.snackbar(title, msg);
  }

  /// Get the current date in ISO 8601 format (e.g., 2023-11-14)
  static String getCurrentDateISO() {
    return DateTime.now().toIso8601String().split('T').first;
  }

  // Get the current time and date in "yyyy-MM-ddTHH:mmZ" format
  static String getCurrentDateTime() {
    // Get current date and time in UTC
    DateTime now = DateTime.now().toUtc();

    // Format the date and time in the desired format
    String formattedDate = DateFormat("yyyy-MM-ddTHH:mm'Z'").format(now);

    return formattedDate;
  }
}
