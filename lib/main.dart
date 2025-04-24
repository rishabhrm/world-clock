import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_time_app/screens/choose_location.dart';
import 'package:world_time_app/screens/home.dart';
import 'package:world_time_app/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Time',
      theme: ThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(
          ThemeData.dark().textTheme
        ),
        primaryColor: Colors.black26
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/choose': (context) => const ChooseLocation()
      },
    );
  }
}
