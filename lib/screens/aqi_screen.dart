import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AQIScreen extends StatefulWidget {
  final aqi;
  final cityName;
  AQIScreen(this.aqi, this.cityName);
  @override
  _AQIScreenState createState() => _AQIScreenState();
}

class _AQIScreenState extends State<AQIScreen> {
  // ignore: non_constant_identifier_names
  var AQI;
  var city;
  var aqiCondition;
  void initState() {
    super.initState();
    getAQIValue(
      widget.aqi,
      widget.cityName,
    );
  }

  void getAQIValue(dynamic aqi, dynamic cityName) {
    setState(() {
      AQI = aqi;
      city = cityName;
      aqiCondition = getAQICondition(AQI);
    });
  }

  // ignore: missing_return
  String getAQICondition(dynamic aqi) {
    if (aqi <= 50)
      return 'Good';
    else if (aqi <= 100)
      return 'Satisfactory';
    else if (aqi <= 200)
      return 'Moderate';
    else if (aqi <= 300)
      return 'Poor';
    else if (aqi <= 400)
      return 'Very Poor';
    else if (aqi <= 500)
      return 'Severe';
    else if ( aqi > 500)
      return 'Hazardous';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AQI Chart',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          iconSize: 24.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Text(
            '$city',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 500,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 50, color: Colors.green),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Color(0xFFA3C853),
                      ),
                      GaugeRange(
                          startValue: 100, endValue: 200, color: Colors.yellow),
                      GaugeRange(
                          startValue: 200, endValue: 300, color: Colors.orange),
                      GaugeRange(
                          startValue: 300, endValue: 400, color: Colors.red),
                      GaugeRange(
                        startValue: 400,
                        endValue: 500,
                        color: Color(0xFF7D0022),
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: AQI.toDouble(),
                        enableAnimation: true,
                        needleColor: Theme.of(context).unselectedWidgetColor,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '$AQI',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            '$aqiCondition',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
