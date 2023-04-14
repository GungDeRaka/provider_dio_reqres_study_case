import 'package:flutter/material.dart';
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
    // print(context.read<APIService>().getAllUsers());
    // print(context.read<ReqresRepository>().getUsersReqres());
    // print(context.read<ReqresProvider>().getUserData());
    // ! checking connection status with switch case more easily
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
        myWidget = ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
          return ListTile(title: Text(state.users[index].email),);
        },);
        break;
    }
    return myWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reqres Study Case"),
        ),
        body: dataDisplayer());
  }
}
