import 'package:carbon_intensity_project/res/app_colors/colors.dart';
import 'package:carbon_intensity_project/utils/constant.dart';
import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  NormalText({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.normalTextColor,
          fontSize: width(context) * 0.045,
          fontWeight: FontWeight.bold),
    );
  }
}
