class MetaData {
  final String? information;
  final String? symbol;
  final String? lastRefreshed;

  final String? interval;
  final String? outputSize;

  final String? timeZone;

  MetaData({
    this.information,
    this.symbol,
    this.lastRefreshed,
    this.interval,
    this.outputSize,

    this.timeZone,
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
