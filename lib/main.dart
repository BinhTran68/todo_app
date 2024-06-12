import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloword/constants/app_colors.dart';
import 'package:helloword/ui/login/login.dart';
import 'package:helloword/ui/onboarding/onboarding_page_view.dart';
import 'package:helloword/ui/splash/splash.dart';
import 'package:helloword/ui/wellcome/welcome_page.dart';


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
        useMaterial3:  true,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      home: Login()
    );
  }
}