class QuotesModel {
  QuotesModel({
    required this.text,
    required this.author,
  });

  final String text;
  final String author;

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      text: json['content'],
      author: json['author'],
    );
  }
}
