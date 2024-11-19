import 'package:carbon_intensity_project/data/network/base_api_services.dart';
import 'package:carbon_intensity_project/data/network/network_api.dart';
import 'package:carbon_intensity_project/data/response/api_response.dart';
import 'package:carbon_intensity_project/utils/utils.dart';

class CarbonServices {
  final BaseApiServices _apiServices = NetworkApi();
  final String baseUrl = 'https://api.carbonintensity.org.uk/intensity';

  // Fetch current carbon intensity
  Future<ApiResponse<Map<String, dynamic>>> fetchCurrentIntensity() async {
    try {
      final response = await _apiServices.getApi(baseUrl);
      print('reponse body : $response');
      if (response != null &&
          response['data'] != null &&
          response['data'].isNotEmpty) {
        print('response1 : ${response['data'][0]}');
        return ApiResponse.completed(response['data'][0]);
      } else {
        return ApiResponse.error("Invalid or empty data received.");
      }
    } catch (e) {
      print("error : $e");
      return ApiResponse.error(e.toString());
    }
  }

  // Fetch half-hourly intensity data for the current day
  Future<ApiResponse<List<dynamic>>> fetchTimeSeriesData() async {
    try {
      final response = await _apiServices.getApi('$baseUrl/date');
      if (response != null && response['data'] != null) {
        print('response2 : ${response['data']}');
        return ApiResponse.completed(response['data']);
      } else {
        return ApiResponse.error("Invalid or empty data received.");
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  // Fetch today's carbon intensity data
  Future<ApiResponse<List<dynamic>>> fetchTodayIntensityData() async {
    try {
      String today = Utils.getCurrentDateTime(); // Ensures ISO date format

      final response = await _apiServices.getApi('$baseUrl/date/$today');
      if (response != null && response['data'] != null) {
        print('response3 : ${response['data']}');
        print('timeDate : $today');
        return ApiResponse.completed(response['data']);
      } else {
        return ApiResponse.error("Invalid or empty data received.");
      }
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
