import 'package:flutter/material.dart';
import 'package:weather_app/services/block.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: true,
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: snapshot.data
            ? ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Color(0xFF18191A),
                appBarTheme: AppBarTheme(
                  color: Color(0xFFBB86FC),
                ),
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.tealAccent,
                  textTheme: ButtonTextTheme.accent,
                ),
                accentIconTheme: IconThemeData(color: Colors.white,),
                  disabledColor: Color(0x1018191A),
              )
            : ThemeData.light().copyWith(
                brightness: Brightness.dark,
                accentIconTheme: IconThemeData(color: Colors.black,),
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.blueAccent,
                  textTheme: ButtonTextTheme.accent,
                ),
                disabledColor: Colors.grey[200],
              ),
        home: LoadingScreen(snapshot.data),
      ),
    );
  }
}
