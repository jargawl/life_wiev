import 'dart:convert';

class QuotesModel {
  QuotesModel(
    this.text,
    this.author,
  );

  final String text;
  final String author;

  QuotesModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        author = json['author'];
}
