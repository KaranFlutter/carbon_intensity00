import 'package:carbon_intensity_project/res/app_colors/colors.dart';
import 'package:carbon_intensity_project/res/app_strings/app_strings.dart';
import 'package:carbon_intensity_project/res/components/internet_exception_widget.dart';
import 'package:carbon_intensity_project/res/components/main_screen_components/carbon_chart.dart';
import 'package:carbon_intensity_project/res/components/main_screen_components/main_container.dart';
import 'package:carbon_intensity_project/res/components/main_screen_components/reload_icon.dart';
import 'package:carbon_intensity_project/res/components/normal_text.dart';
import 'package:carbon_intensity_project/res/routes/routes_name.dart';
import 'package:carbon_intensity_project/utils/constant.dart';
import 'package:carbon_intensity_project/view_models/controller/carbon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final CarbonController carbonController = Get.put(CarbonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NormalText(text: AppStrings.appName),
        centerTitle: true,
      ),
      body: Obx(() {
        //if data if off
        if (carbonController.isOffline.value) {
          return InternetExceptionWidget();
        }

        // Loading state
        if (carbonController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteColor,
            ),
          );
        }

        // Error or empty data state
        if (carbonController.carbonValues.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(
                  text: AppStrings.noDataAvailable,
                ),
                ReloadIcon(onTap: () => Get.toNamed(RoutesName.mainScreen))
              ],
            ),
          );
        }

        // Main content
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reload data text and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(text: AppStrings.reloadData),
                    ReloadIcon(
                      onTap: () => carbonController.fetchCurrentIntensity(),
                    ),
                  ],
                ),
                SizedBox(height: height(context) * 0.02),

                // Carbon Intensity Card
                Obx(() => MainContainer(
                      carbonValue: carbonController.carbonIntensity.value,
                      level: carbonController.intensityLevel.value,
                    )),
                SizedBox(height: height(context) * 0.03),

                // Chart Title
                NormalText(text: AppStrings.note2),
                SizedBox(height: height(context) * 0.02),

                // Carbon Chart
                Obx(() =>
                    CarbonChart(spots: carbonController.carbonValues.value)),

                SizedBox(height: 40),
              ],
            ),
          ),
        );
      }),
    );
  }
}
