import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //   theme: ThemeData.dark(),
      //  scaffoldBackgroundColor: Color(0xFFd6d6d6),
        theme: ThemeData.light().copyWith(
          brightness: Brightness.dark,
        accentIconTheme: IconThemeData(
          color: Colors.black,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.accent,
        ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          backgroundColor: Color(0xFF18191A),
          appBarTheme: AppBarTheme(
            color: Color(0xFFBB86FC),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.tealAccent,
            textTheme: ButtonTextTheme.accent,
          ),
          accentIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
    //   themeMode: ThemeMode.system,
      themeMode: ThemeMode.dark,
       home: LoadingScreen(),
     );
   }
}
