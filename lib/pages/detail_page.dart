// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_provider_studycase_reqres/models/user_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
      ),
      body: Column(
        children: [
          Hero(
            tag: user.id,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.avatar),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
