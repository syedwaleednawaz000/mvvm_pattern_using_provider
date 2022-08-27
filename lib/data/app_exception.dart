class AppException implements Exception{
  late final  _message ;
  late final  _prefix;
  AppException([ this._message, this._prefix]);
  String toString(){
    return "$_message $_prefix";
  }

}
/// error occur during the send request to server like internet issue
class FetchDataException extends AppException{
  FetchDataException([String? message]) : super (message, "Error during communication");
}
/// error occur due to enter invalid url
class BadRequestException extends AppException{
  BadRequestException([String? message]) : super (message, "Invalid Request URL");
}

/// error occur due to invalid exception user management with token
class UnAuthorisedException extends AppException{
  UnAuthorisedException([String? message]) : super (message, "UnAuthorised Request");
}
/// error occur due to invalid exception user management with token
class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super (message, "UnAuthorised Request");
}