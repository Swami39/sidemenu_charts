// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:candlesticks/candlesticks.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class CandlestickWidget extends StatefulWidget {
  const CandlestickWidget(
      {Key key,
      this.width,
      this.height,
      this.symbol,
      this.interval,
      this.symint})
      : super(key: key);

  final double width;
  final double height;
  final String symbol;
  final String interval;
  final List<CandlesticksRecord> symint;

  @override
  _CandlestickWidgetState createState() => _CandlestickWidgetState();
}

class _CandlestickWidgetState extends State<CandlestickWidget> {
  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    // for (var result in widget.symint) {
    symbol = 'BTCUSDT';
    interval = '1h';

    // symbol = result.symbol;
    // interval= result.interval;
    // }
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  String interval;
  String symbol;

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTCUSDT 1H Chart"),
      ),
      body: Center(
        child: Candlesticks(
          candles: candles,
        ),
      ),
    );
  }
}
