import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Color(0xFF18191A),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 45.0,
                    //  color: Theme.of(context).accentIconTheme.color,
                    //  color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(
                   //   color: Colors.black,
                      fontSize: 22.0,
                    ),
                    decoration: InputDecoration(
                   //   fillColor: Colors.white70,
                      filled: true,
                      icon: Icon(
                        Icons.my_location,
                  //      color: Colors.white,
                        color: Theme.of(context).accentIconTheme.color,
                        size: 32.0,
                      ),
                      hintText: 'Enter location',
                      hintStyle: TextStyle(
                     //   color: Theme.of(context).accentColor,
                        fontSize: 22.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                    //    borderSide: BorderSide.none,
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
