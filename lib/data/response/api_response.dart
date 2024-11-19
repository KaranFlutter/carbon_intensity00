import 'package:carbon_intensity_project/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? msg;

  ApiResponse([this.status, this.data, this.msg]);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.msg) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Data : $data \n Message : $msg';
  }
}
