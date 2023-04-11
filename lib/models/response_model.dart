// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_provider_studycase_reqres/models/support_model.dart';
import 'package:flutter_provider_studycase_reqres/models/user_model.dart';

class ResponseModel extends Equatable {
  const ResponseModel(
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  );

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      map['page'] as int,
      map['per_page'] as int,
      map['total'] as int,
      map['total_pages'] as int,
      List<UserModel>.from(
        (map['data'] as List<int>).map<UserModel>(
          (x) => UserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      SupportModel.fromMap(map['support'] as Map<String, dynamic>),
    );
  }

  final List<UserModel> data;
  final int page;
  final int perPage;
  final SupportModel support;
  final int total;
  final int totalPages;

  @override
  List<Object> get props {
    return [
      page,
      perPage,
      total,
      totalPages,
      data,
      support,
    ];
  }

  @override
  bool get stringify => true;

  ResponseModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserModel>? data,
    SupportModel? support,
  }) {
    return ResponseModel(
      page ?? this.page,
      perPage ?? this.perPage,
      total ?? this.total,
      totalPages ?? this.totalPages,
      data ?? this.data,
      support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data.map((x) => x.toMap()).toList(),
      'support': support.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
