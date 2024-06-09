import 'package:flutter/material.dart';
import 'package:helloword/ui/onboarding/onboarding_page_view.dart';
import 'package:helloword/ui/splash.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp() ,
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3:  true
      ),
      home: const OnboardingPageView(),
    );
  }
}