class MetaData {
  String information;
  String symbol;
  String lastRefreshed;
  String interval;
  String outputSize;
  String timeZone;

  MetaData({
    required this.information,
    required this.symbol,
    required this.lastRefreshed,
    required this.interval,
    required this.outputSize,
    required this.timeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      information: json['1. Information'],
      symbol: json['2. Symbol'],
      lastRefreshed: json['3. Last Refreshed'],
      interval: json['4. Interval'],
      outputSize: json['5. Output Size'],
      timeZone: json['6. Time Zone'],
    );
  }
}