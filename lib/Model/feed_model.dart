
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
  String? overallSentimentScore;
  String? overallSentimentLabel;
  List<String>? authors;
  List<Topics>? topics;
  List<TickerSentiments>? tickerSentiments;


  Feed({
    this.title,
    this.url,
    this.timePublished,
    this.bannerImage,
    this.overallSentimentLabel,
    this.overallSentimentScore,
    this.summary,
    this.authors,
    this.topics,
    this.tickerSentiments

  });

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    timePublished = json['time_published'];
    summary = json['summary'];
    bannerImage = json['banner_image'];
    overallSentimentLabel = json['overall_sentiment_label'];
    overallSentimentScore = json['overall_sentiment_score'];
    authors = json['authors'];
    tickerSentiments = json['ticker_sentiment'];

  }
}
