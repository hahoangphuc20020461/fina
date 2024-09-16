import 'package:fina/Model/metadata_model.dart';
import 'package:fina/Model/timeseries_model.dart';

class StockWeekData {
  final MetaData? metaData;
  final Map<String, TimeSeriesData>? timeSeries;

  StockWeekData({this.metaData, this.timeSeries});

  factory StockWeekData.fromJson(Map<String, dynamic> json) {
    return StockWeekData(
      metaData: MetaData.fromJson(json['Meta Data']),
      timeSeries: (json['Weekly Time Series'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, TimeSeriesData.fromJson(value)),
      ),
    );
  }
}
