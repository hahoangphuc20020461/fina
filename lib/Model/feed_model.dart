import 'package:fina/Model/ticker_sentiments_model.dart';
import 'package:fina/Model/topics_model.dart';

class FeedData {
  List<Feed> feedList;
  FeedData({required this.feedList});

  factory FeedData.fromJson(Map<String, dynamic> map) {
    return FeedData(
        feedList: List<Feed>.from(
      (map['feed'].map((e) => Feed.fromJson(e))),
    ));
  }
}

class Feed {
  String? title;
  String? url;
  String? timePublished;
  String? bannerImage;
  String? summary;
  double? overallSentimentScore;
  String? overallSentimentLabel;
  List<String>? authors;
  List<Topics>? topics;
  List<TickerSentiments>? tickerSentiments;

  Feed(
      {this.title,
      this.url,
      this.timePublished,
      this.bannerImage,
      this.overallSentimentLabel,
      this.overallSentimentScore,
      this.summary,
      this.authors,
      this.topics,
      this.tickerSentiments});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      title: json["title"],
      url: json["url"],
      timePublished: json["time_published"],
      authors: json["authors"] == null
          ? []
          : List<String>.from(json["authors"]!.map((x) => x)),
      summary: json["summary"],
      bannerImage: json["banner_image"],
      topics: json["topics"] == null
          ? []
          : List<Topics>.from(json["topics"]!.map((x) => Topics.fromJson(x))),
      overallSentimentScore: json["overall_sentiment_score"],
      overallSentimentLabel: json["overall_sentiment_label"],
      tickerSentiments: json["ticker_sentiment"] == null
          ? []
          : List<TickerSentiments>.from(json["ticker_sentiment"]!
              .map((x) => TickerSentiments.fromJson(x))),
    );
  }
}
