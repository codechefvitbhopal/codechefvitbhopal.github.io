/// FeedbackForm is a data class which stores data fields of Feedback.
class LeaderBoardModel {
  String rank;
  String name;
  String score;

  LeaderBoardModel(this.name, this.rank, this.score);

  factory LeaderBoardModel.fromJson(dynamic json) {
    return LeaderBoardModel(
      "${json['name']}",
      "${json['rank']}",
      "${json['score']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'rank': rank,
        'score': score,
      };
}
