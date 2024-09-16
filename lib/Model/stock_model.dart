import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/timeseries_model.dart';

class StockData {
  final MetaData? metaData;
  final Map<String, TimeSeriesData>? timeSeries;

  StockData({this.metaData, this.timeSeries});

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      metaData: MetaData.fromJson(json['Meta Data']),
      timeSeries: (json['Time Series (5min)'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TimeSeriesData.fromJson(value)),
      ),
    );
  }
}

