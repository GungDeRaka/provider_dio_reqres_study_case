import 'package:flutter_provider_studycase_reqres/models/user_model.dart';
import 'package:flutter_provider_studycase_reqres/services/api_services.dart';

import '../models/custom_exception.dart';

class ReqresRepository {
  ReqresRepository({required this.service});

  final APIService service;

  Future<List<UserModel>?> getUsersReqres() async {
    try {
      var result = await APIService().getAllUsers();
      if(result !=null){
        return result.data;
      }
      return null;
    } catch (e) {
      throw CustomError(errorMessage: e.toString());
    }
  }
}
