import 'package:bmi_app/Util/color.dart';
import 'package:bmi_app/Views/inputPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: kMainColor,
          appBarTheme: const AppBarTheme(backgroundColor: kMainColor),
          textTheme: const TextTheme(bodyText2: TextStyle(color: kTextColor),),),
      title: 'BMI Calculator',
      home: const InputPage(),
    );
  }
}
