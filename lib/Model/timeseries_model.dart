class TimeSeriesData {
  String open;
  String high;
  String low;
  String close;
  String volume;

  TimeSeriesData({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) {
    return TimeSeriesData(
      open: json['1. open'],
      high: json['2. high'],
      low: json['3. low'],
      close: json['4. close'],
      volume: json['5. volume'],
    );
  }
}