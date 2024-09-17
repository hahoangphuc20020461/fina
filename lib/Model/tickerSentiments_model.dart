class TickerSentiment {
  TickerSentiment({
    required this.ticker,
    required this.relevanceScore,
    required this.tickerSentimentScore,
    required this.tickerSentimentLabel,
  });

  final String? ticker;
  final String? relevanceScore;
  final String? tickerSentimentScore;
  final String? tickerSentimentLabel;

  factory TickerSentiment.fromJson(Map<String, dynamic> json) {
    return TickerSentiment(
      ticker: json["ticker"],
      relevanceScore: json["relevance_score"],
      tickerSentimentScore: json["ticker_sentiment_score"],
      tickerSentimentLabel: json["ticker_sentiment_label"],
    );
  }
}
