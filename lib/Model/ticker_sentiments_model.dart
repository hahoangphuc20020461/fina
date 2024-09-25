class TickerSentiments {
  String? ticker;
  String? relevanceScore;
  String? tickerSentimentsScore;
  String? tickerSentimentsLabel;

  TickerSentiments(
      {this.ticker,
      this.relevanceScore,
      this.tickerSentimentsLabel,
      this.tickerSentimentsScore});

  TickerSentiments.fromJson(Map<String, dynamic> json) {
    ticker = json['ticker'];
    relevanceScore = json['relevance_score'];
    tickerSentimentsScore = json['ticker_sentiment_score'];
    tickerSentimentsLabel = json['ticker_sentiment_label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticker'] = this.ticker;
    data['relevance_score'] = this.relevanceScore;
    data['ticker_sentiment_score'] = this.tickerSentimentsScore;
    data['ticker_sentiment_label'] = this.tickerSentimentsLabel;
    return data;
  }
}
