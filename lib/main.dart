import 'package:flutter/material.dart';
import 'package:me/screens/Loginpage.dart';
import 'package:me/screens/add_note_page.dart';
import 'package:me/screens/homepage.dart';
import 'package:me/screens/sighn_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          border: InputBorder.none,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SighnInPage.routs,
      routes: <String, WidgetBuilder>{
        Loginpage.routs: (context) => const Loginpage(),
        SighnInPage.routs: (context) => const SighnInPage(),
        Homepage.routs: (context) => const Homepage(),
        AddNotePage.routs: (context) => const AddNotePage(),
      },
    );
  }
}
