import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/timeseries_model.dart';

class StockMonthData {
  final MetaData? metaData;
  final Map<String, TimeSeriesData>? timeSeries;

  StockMonthData({this.metaData, this.timeSeries});

  factory StockMonthData.fromJson(Map<String, dynamic> json) {
    return StockMonthData(
      metaData: MetaData.fromJson(json['Meta Data']),
      timeSeries: (json['Monthly Time Series'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TimeSeriesData.fromJson(value)),
      ),
    );
  }
}
