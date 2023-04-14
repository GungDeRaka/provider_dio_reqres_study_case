// ignore_for_file: public_member_api_docs, sort_constructors_first
//buat enum reqresStatus
import 'package:equatable/equatable.dart';

import 'package:flutter_provider_studycase_reqres/models/custom_exception.dart';
import 'package:flutter_provider_studycase_reqres/models/user_model.dart';

enum ReqresStatus { initial, loading, loaded, error }

class ReqresState extends Equatable {
  const ReqresState({
    required this.status,
    required this.errorMessage,
    required this.users,
  });

  factory ReqresState.initial() => const ReqresState(
      status: ReqresStatus.initial, errorMessage: CustomError(), users: []);

  final CustomError errorMessage;
  final ReqresStatus status;
  final List<UserModel> users;

  @override
  List<Object> get props => [status, errorMessage, users];

  @override
  bool get stringify => true;

  ReqresState copyWith({
    ReqresStatus? status,
    CustomError? errorMessage,
    List<UserModel>? users,
  }) {
    return ReqresState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }
}
