class HttpStatus {
  late final int _statusCode;
  HttpStatus(int statusCode) {
    _statusCode = statusCode;
  }
  int get statusCode => _statusCode;
  static HttpStatus fromStatusCode(int statusCode) {
    return HttpStatus(statusCode);
  }
}