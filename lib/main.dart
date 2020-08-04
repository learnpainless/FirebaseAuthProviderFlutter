import 'package:flutter/material.dart';
import 'package:flutter_provider_proto/my_app.dart';
import 'package:flutter_provider_proto/providers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider.instance())
    ],
    child: MyApp(),
  ));
}
