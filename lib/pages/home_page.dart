import 'package:flutter/material.dart';
import 'package:flutter_provider_studycase_reqres/common_widgets/user_card.dart';
import 'package:flutter_provider_studycase_reqres/pages/detail_page.dart';
import 'package:flutter_provider_studycase_reqres/providers/reqres_provider.dart';
import 'package:flutter_provider_studycase_reqres/repositories/reqres_repository.dart';
import 'package:flutter_provider_studycase_reqres/services/api_services.dart';
import 'package:provider/provider.dart';

import '../providers/reqres_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ReqresProvider reqresProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqresProvider = context.read<ReqresProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reqresProvider.getUserData();
    });
  }

  Widget dataDisplayer() {
    var state = context.watch<ReqresProvider>().state;
    Widget myWidget = Container();
    switch (state.status) {
      case ReqresStatus.initial:
        myWidget = Container();
        break;
      case ReqresStatus.loading:
        myWidget = const Center(child: CircularProgressIndicator());
        break;
      case ReqresStatus.error:
        myWidget = Center(
          child: Text("Error ${state.errorMessage}"),
        );
        break;
      case ReqresStatus.loaded:
        myWidget = GridView.builder(
          itemCount: state.users.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            var user = state.users[index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(user: user),
                      ));
                },
                child: UserCard(user: user));
          },
        );
        break;
    }
    return myWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reqres Study Case"),
        ),
        body: dataDisplayer());
  }
}
