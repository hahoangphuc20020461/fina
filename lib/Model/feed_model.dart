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

  Feed({
    this.title,
    this.url,
    this.timePublished,
    this.bannerImage,
  });

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    timePublished = json['time_published'];

    bannerImage = json['banner_image'];
  }
}
