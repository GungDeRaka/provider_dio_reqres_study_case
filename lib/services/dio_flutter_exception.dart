import 'package:dio/dio.dart';

String dioException(DioError e) {
  return "Request Failed\nStatus Code: ${e.error}\nReason: ${e.message}";
}
