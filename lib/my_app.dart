import 'package:flutter/material.dart';
import 'package:flutter_provider_proto/providers/login_provider.dart';
import 'package:flutter_provider_proto/screens/home_screen.dart';
import 'package:flutter_provider_proto/screens/login_screen.dart';
import 'package:flutter_provider_proto/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Proto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _showScreen(context),
    );
  }
}

Widget _showScreen(BuildContext context) {
  switch (context.watch<LoginProvider>().appState) {
    case AppState.authenticating:
    case AppState.unauthenticated:
      return LoginScreen();
    case AppState.initial:
      return SplashScreen();
    case AppState.authenticated:
      return HomeScreen(
        user: context.watch<LoginProvider>().user,
      );
  }
  return Container();
}
