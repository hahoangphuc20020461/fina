import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/timeseries_model.dart';

class StockDayData {
  final MetaData? metaData;
  final Map<String, TimeSeriesData>? timeSeries;

  StockDayData({this.metaData, this.timeSeries});

  factory StockDayData.fromJson(Map<String, dynamic> json) {
    return StockDayData(
      metaData: MetaData.fromJson(json['Meta Data']),
      timeSeries: (json['Time Series (Daily)'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TimeSeriesData.fromJson(value)),
      ),
    );
  }
}
