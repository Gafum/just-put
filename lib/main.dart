// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_put/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Put',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Calibri',
      ),
      home: const HomePage(),
    );
  }
}
