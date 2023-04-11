// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SupportModel extends Equatable {
  const SupportModel(
    this.url,
    this.text,
  );

  factory SupportModel.fromJson(String source) =>
      SupportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SupportModel.fromMap(Map<String, dynamic> map) {
    return SupportModel(
      map['url'] as String,
      map['text'] as String,
    );
  }

  final String text;
  final String url;

  @override
  List<Object> get props => [url, text];

  @override
  bool get stringify => true;

  SupportModel copyWith({
    String? url,
    String? text,
  }) {
    return SupportModel(
      url ?? this.url,
      text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'text': text,
    };
  }

  String toJson() => json.encode(toMap());
}
