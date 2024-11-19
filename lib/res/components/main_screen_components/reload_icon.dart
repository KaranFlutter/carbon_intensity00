import 'package:carbon_intensity_project/res/app_colors/colors.dart';
import 'package:carbon_intensity_project/utils/constant.dart';
import 'package:flutter/material.dart';

class ReloadIcon extends StatelessWidget {
  ReloadIcon({required this.onTap});

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap,
      icon: Icon(
        Icons.refresh,
        color: AppColors.normalTextColor,
        size: width(context) * 0.06,
      ),
    );
  }
}
