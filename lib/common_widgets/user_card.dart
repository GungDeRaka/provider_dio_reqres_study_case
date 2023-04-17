import 'package:flutter/material.dart';
import 'package:flutter_provider_studycase_reqres/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Column(
      children: [
        Hero(
          tag: user.id,
          child: Container(
            height: 128,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(user.avatar),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            "${user.firstName} ${user.lastName}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${user.email}",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        )
      ],
    ));
  }
}
