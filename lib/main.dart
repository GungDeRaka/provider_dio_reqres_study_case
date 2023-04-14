import 'package:flutter/material.dart';
import 'package:flutter_provider_studycase_reqres/providers/reqres_provider.dart';
import 'package:flutter_provider_studycase_reqres/repositories/reqres_repository.dart';
import 'package:flutter_provider_studycase_reqres/services/api_services.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
//! menggunakan provider dengan cara ini tidak efsien,karena class" saling berketergantungan
        /*ChangeNotifierProvider(
          create: (_) => ReqresProvider(
            repository: ReqresRepository(
              service: APIService(),
            ),
          ),
        ),*/
//? kita dapat menggunakan provider as dependency injection agar menghilangkan "ketergantungan" tersebut
        Provider<APIService>(
          create: (context) => APIService(),
        ),
        Provider<ReqresRepository>(
          create: (context) => ReqresRepository(
            service: context.read<APIService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ReqresProvider(repository: context.read<ReqresRepository>()),
        )
      ], child: const MyHomePage()),
    );
  }
}
