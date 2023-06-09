// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  const CustomError({
    this.errorMessage= '',
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

  @override
  bool get stringify => true;
}
