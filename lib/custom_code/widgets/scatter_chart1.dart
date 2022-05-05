// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChart1 extends StatefulWidget {
  const ScatterChart1({
    Key key,
    this.width,
    this.height,
    this.scatterspots,
  }) : super(key: key);

  final double width;
  final double height;
  final List<ScatterchartRecord> scatterspots;

  @override
  _ScatterChart1State createState() => _ScatterChart1State();
}

class _ScatterChart1State extends State<ScatterChart1> {
  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        scatterSpots: [
          ScatterSpot(
            4,
            4,
          ),
        ],
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 10,
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          checkToShowHorizontalLine: (value) => true,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.white.withOpacity(0.5)),
          drawVerticalLine: true,
          checkToShowVerticalLine: (value) => true,
          getDrawingVerticalLine: (value) =>
              FlLine(color: Colors.white.withOpacity(0.5)),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: false,
        ),
      ),
    );
  }
}
