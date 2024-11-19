import 'package:carbon_intensity_project/res/app_strings/app_strings.dart';
import 'package:carbon_intensity_project/res/components/normal_text.dart';
import 'package:carbon_intensity_project/utils/constant.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  MainContainer({required this.carbonValue, required this.level});
  final String carbonValue;
  final String level;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent, width: 2)),
      padding: EdgeInsets.all(width(context) * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.nationalCarbonntensity,
            style:
                TextStyle(color: Colors.white, fontSize: width(context) * 0.05),
          ),
          SizedBox(height: height(context) * 0.01),
          Text(
            carbonValue,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: width(context) * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height(context) * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: height(context) * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: NormalText(text: AppStrings.note)),
              CircleAvatar(
                  radius: width(context) * 0.12,
                  backgroundColor: Colors.black,
                  child: NormalText(text: level)),
            ],
          ),
        ],
      ),
    );
  }
}
