import 'package:flutter/material.dart';
import 'View/StartView.dart';
import 'View/NewView.dart';
import 'View/StartView.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angry Monster',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
        routes: {
          '/': (context) => NewView(),
          '/start': (context) => StartView(),
        },
      theme: ThemeData(
        primarySwatch: _imsMaterialColor
      ),
    );
  }

  MaterialColor _imsMaterialColor =
  new MaterialColor(_imsPrimaryValue, <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_imsPrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });
  static final int _imsPrimaryValue = 0xFFFCFEFC;
}
