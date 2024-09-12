class Topics {
  String? topic;
  String? relevanceScore;
  Topics({this.topic, this.relevanceScore});

  
  Topics.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    relevanceScore = json['relevance_score'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['relevance_score'] = this.relevanceScore;
    return data;
  }
}
