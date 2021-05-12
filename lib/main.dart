import 'package:flutter/material.dart';
import 'package:flutter_web_demo/home_screen.dart';
import 'package:flutter_web_demo/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
  providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
  child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
