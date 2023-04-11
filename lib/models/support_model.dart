// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SupportModel extends Equatable {
  const SupportModel(
    this.text,
    this.url,
  );

  factory SupportModel.fromJson(String source) =>
      SupportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SupportModel.fromMap(Map<String, dynamic> map) {
    return SupportModel(
      map['text'] as String,
      map['url'] as String,
    );
  }

  final String text;
  final String url;

  @override
  List<Object> get props => [text, url];

  @override
  bool get stringify => true;

  SupportModel copyWith({
    String? text,
    String? url,
  }) {
    return SupportModel(
      text ?? this.text,
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());
}
