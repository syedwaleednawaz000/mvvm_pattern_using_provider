import 'package:mvvm_pattren/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.LAODING;

  ApiResponse.completed(data) : status = Status.COMPLETED;

  ApiResponse.error(message) : status = Status.ERROR;
  @override
  String toString(){
    return "Status : $status \n Message $message \n Data $data ";
  }
}
