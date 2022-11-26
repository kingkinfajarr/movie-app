import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:elemes_id_test/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        routerDelegate: goRouter.routerDelegate,
        title: 'Movies App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppThemes.scaffoldColor,
          primarySwatch: Colors.green,
        ),
      ),
    );
  }
}
