import 'package:carbon_intensity_project/data/response/status.dart';
import 'package:carbon_intensity_project/view_models/services/carbon%20services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class CarbonController extends GetxController {
  final CarbonServices _carbonService = CarbonServices();

  // Observable variables
  var carbonIntensity = ''.obs; // Current carbon intensity (gCO₂/kWh)
  var intensityLevel = ''.obs; // Intensity level (LOW, MEDIUM, HIGH)
  var carbonValues = <FlSpot>[].obs; // Chart data for today's intensity
  var isLoading = false.obs; // Loading state
  var isOffline = false.obs; // To track if the device is offline

  // Check connectivity status
  Future<void> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection
      isOffline.value = true;
      Get.snackbar("No Internet", "Please check your internet connection.");
    } else {
      isOffline.value = false;
    }
  }

  // Fetch today's carbon intensity data
  Future<void> fetchTodayCarbonIntensityData() async {
    isLoading.value = true;

    try {
      await checkConnectivity(); // Check connectivity before proceeding
      if (isOffline.value) return; // Return if the device is offline

      // Call service to fetch today's data
      final todayResponse = await _carbonService.fetchTodayIntensityData();

      if (todayResponse.status == Status.COMPLETED) {
        final todayData = todayResponse.data!;

        // Update chart data
        carbonValues.clear();
        for (var i = 0; i < todayData.length; i++) {
          double intensity =
              todayData[i]['intensity']['actual']?.toDouble() ?? 0.0;
          carbonValues.add(FlSpot(i.toDouble(), intensity));
          print('carbon values : $intensity');
        }
      } else {
        // Handle error response
        Get.snackbar("Error", todayResponse.msg ?? "An error occurred.");
      }
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar("Error", "An unexpected error occurred: $e");
    } finally {
      isLoading.value = false; // Ensure isLoading is set to false when done
    }
  }

  // Determine intensity level based on value
  String _getIntensityLevel(int actualValue) {
    if (actualValue > 200) {
      return 'HIGH';
    } else if (actualValue > 100) {
      return 'MEDIUM';
    } else {
      return 'LOW';
    }
  }

  Future<void> fetchCurrentIntensity() async {
    isLoading.value = true;

    try {
      await checkConnectivity(); // Check connectivity before proceeding
      if (isOffline.value) return; // Return if the device is offline

      final currentData = await _carbonService.fetchCurrentIntensity();

      if (currentData.status == Status.COMPLETED) {
        final currentIntensity = currentData.data!;

        if (currentIntensity.isNotEmpty) {
          final latestIntensity = currentIntensity['intensity']['actual'] ?? 0;
          carbonIntensity.value = '$latestIntensity gCO₂/kWh';
          intensityLevel.value = _getIntensityLevel(latestIntensity);
        }
      } else {
        Get.snackbar(
            "Error", currentData.msg ?? "Failed to fetch current intensity.");
      }
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar("Error", "An unexpected error occurred: $e");
    } finally {
      isLoading.value = false; // Set isLoading to false when done
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodayCarbonIntensityData();
    fetchCurrentIntensity();
    // Fetch today's data and current intensity when the controller is initialized
  }
}
