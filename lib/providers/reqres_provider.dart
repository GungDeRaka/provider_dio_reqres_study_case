// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_provider_studycase_reqres/models/custom_exception.dart';

import 'package:flutter_provider_studycase_reqres/providers/reqres_state.dart';
import 'package:flutter_provider_studycase_reqres/repositories/reqres_repository.dart';

class ReqresProvider extends ChangeNotifier {
  ReqresState _state = ReqresState.initial();
  ReqresState get state=> _state;

  final ReqresRepository repository;
  ReqresProvider({
    required this.repository,
  });

Future<void> getUserData()async {
  _state = _state.copyWith(status: ReqresStatus.loading);
  notifyListeners();

  try {
    final users = await repository.getUsersReqres();
    _state = _state.copyWith(status: ReqresStatus.loaded,users:users );
    print("state provider $_state");
    notifyListeners();
  }on CustomError catch (e) {
    _state = _state.copyWith(status: ReqresStatus.error,errorMessage: e);
    notifyListeners();
  }
}

}
