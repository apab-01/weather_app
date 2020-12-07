import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  final tempForecast;
  final timeIn24Hour;
  LineChartSample2(this.tempForecast,this.timeIn24Hour);
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  var hourlyTempForecast = new List();
  var time = new List();
  var t0;
  var t1;
  var t2;
  var t3;
  var t4;
  var t5;
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

//  bool showAvg = false;

  @override
  void initState() {
    super.initState();
    getData(
      widget.tempForecast,
      widget.timeIn24Hour,
    );
  }
  void getData(dynamic tempForecast,dynamic timeIn24Hour){
    setState(() {
      hourlyTempForecast = tempForecast;
      time = timeIn24Hour;
      t0 = (hourlyTempForecast[0].toDouble())/10 + 2;
      t1 = (hourlyTempForecast[2].toDouble())/10 + 2;
      t2 = (hourlyTempForecast[4].toDouble())/10 + 2;
      t3 = (hourlyTempForecast[6].toDouble())/10 + 2;
      t4 = (hourlyTempForecast[8].toDouble())/10 + 2;
      t5 = (hourlyTempForecast[10].toDouble())/10 + 2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today\'s Temperature Curve',
        style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
      ),
      ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          iconSize: 26.0,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.70,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  //  color: Color(0xff232d37),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.8,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.8,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 13,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return time[0];
              case 3:
                return time[2];
              case 6:
                return time[4];
              case 9:
                return time[6];
              case 12:
                return time[8];
              case 15:
                return time[10];
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '-20°';
              case 1:
                return '-10°';
              case 2:
                return '0°';
              case 3:
                return '10°';
              case 4:
                return '20°';
              case 5:
                return '30°';
              case 6:
                return '40°';
              case 7:
                return '50°';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 15,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0,t0),
            FlSpot(3,t1),
            FlSpot(6,t2),
            FlSpot(9,t3),
            FlSpot(12,t4),
            FlSpot(15,t5),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  // LineChartData avgData() {
  //   return LineChartData(
  //     lineTouchData: LineTouchData(enabled: false),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: true,
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         getTextStyles: (value) => const TextStyle(
  //             color: Color(0xff68737d),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 15),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 0:
  //               return time[0];
  //             case 3:
  //               return time[2];
  //             case 6:
  //               return time[4];
  //             case 9:
  //               return time[6];
  //             case 12:
  //               return time[8];
  //             case 15:
  //               return time[10];
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff67727d),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 0:
  //               return '-20';
  //             case 1:
  //               return '-10';
  //             case 2:
  //               return '0';
  //             case 3:
  //               return '10';
  //             case 4:
  //               return '20';
  //             case 5:
  //               return '30';
  //             case 6:
  //               return '40';
  //             case 7:
  //               return '50';
  //           }
  //           return '';
  //         },
  //         reservedSize: 28,
  //         margin: 12,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true,
  //         border: Border.all(color: const Color(0xff37434d), width: 1)),
  //     minX: 0,
  //     maxX: 12,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: [
  //           FlSpot(0, 22.5),
  //           FlSpot(3, 22.5),
  //           FlSpot(6, 22.5),
  //           FlSpot(9, 22.5),
  //           FlSpot(12, 22.5),
  //           FlSpot(15, 22.5),
  //         ],
  //         isCurved: true,
  //         colors: [
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
  //         ],
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(show: true, colors: [
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //               .lerp(0.2)
  //               .withOpacity(0.1),
  //           ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //               .lerp(0.2)
  //               .withOpacity(0.1),
  //         ]),
  //       ),
  //     ],
  //   );
  // }
}
