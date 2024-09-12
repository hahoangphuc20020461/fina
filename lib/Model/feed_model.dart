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

  Feed({
    this.title,
    this.url,
    this.timePublished,
    this.bannerImage,
    this.overallSentimentLabel,
    this.overallSentimentScore,
    this.summary,
    this.authors,
    this.topics
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
  }
}
