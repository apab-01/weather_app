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
          disabledColor: Colors.grey[200],
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF18191A),
        //  scaffoldBackgroundColor: Color(0xFF121212),
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
          disabledColor: Color(0x721E1E1E),
        //  disabledColor: Color(0x0018191A),
        ),
   //    themeMode: ThemeMode.system,
      themeMode: ThemeMode.dark,
       home: LoadingScreen(),
     );
   }
}
