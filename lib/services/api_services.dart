import "package:dio/dio.dart";
import "package:flutter_provider_studycase_reqres/models/response_model.dart";
import "package:flutter_provider_studycase_reqres/services/dio_flutter_exception.dart";

class APIService {
  late final Dio _dio;

  APIService() {
    _dio = Dio();
  }
  Future<ResponseModel?> getAllUsers() async {
    const String baseUrl = "https://reqres.in/api/users?page=2";
    final Uri uri = Uri.parse(baseUrl);
    try {
      var response = await Dio().getUri(uri);
      if(response.statusCode == 200){
        var result = response.data;
        print(ResponseModel.fromMap(result));
        return ResponseModel.fromMap(result);
      }
      return null;
    }on DioError catch (e) {
      throw Exception(dioException(e));
    }
  }
}
