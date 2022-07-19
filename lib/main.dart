import 'package:bmi_app/Func/calculatorBrain.dart';
import 'package:bmi_app/Util/color.dart';
import 'package:flutter/material.dart';

import 'Screens/inputPage.dart';
import 'Screens/resultsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kMainColor,
        appBarTheme: const AppBarTheme(backgroundColor: kMainColor),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: kTextColor),
        ),
      ),
      title: 'BMI Calculator',
      initialRoute: '/',
      routes: {
        '/': ((context) => const InputPage()),
        // '/result': (context) => ResultPage(
        //     )
      },
    );
  }
}
