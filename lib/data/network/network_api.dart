import 'dart:convert';
import 'dart:io';

import 'package:carbon_intensity_project/data/app_exceptions.dart';
import 'package:carbon_intensity_project/data/network/base_api_services.dart';
import 'package:carbon_intensity_project/res/components/internet_exception_widget.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseApiServices {
  // APIs Get responses

  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } catch (e) {
    } on SocketException {
      InternetException('');
      InternetExceptionWidget();
    } on RequestTimeOut {
      return RequestTimeOut('');
    }

    return responseJson;
  }

  // APIs Post response

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(
              data) // 'jsonEncode' if row data comes... otherwise only 'data'
          );
      responseJson = returnResponse(response);
    } catch (e) {
    } on SocketException {
      return InternetException('');
    } on RequestTimeOut {
      return RequestTimeOut('');
    }

    return responseJson;
  }

  //APis status code messages

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw invaildUrlException();

      default:
        throw FetchDataException();
    }
  }
}
