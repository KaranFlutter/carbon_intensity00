class AppExceptions implements Exception {
  final _msg;
  final _prefix;

  AppExceptions([this._msg, this._prefix]);

  String toString() {
    return '$_prefix$_msg';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? msg]) : super(msg, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? msg]) : super(msg, 'Request time out!!');
}

class ServerException extends AppExceptions {
  ServerException([String? msg]) : super(msg, 'No server connection...');
}

class invaildUrlException extends AppExceptions {
  invaildUrlException([String? msg]) : super(msg, 'Invaild URL');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? msg]) : super(msg, 'No data Found');
}
