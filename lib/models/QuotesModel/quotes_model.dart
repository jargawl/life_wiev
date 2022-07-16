import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  factory QuotesModel(
    @JsonKey(name: 'content') String text,
    String author,
  ) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$QuotesModelFromJson(json);
}




// @JsonSerializable()
// class QuotesModel {
//   QuotesModel({
//     required this.text,
//     required this.author,
//   });

// @JsonKey(name: 'content')
//   final String text;

//   final String author;


//   factory QuotesModel.fromJson(Map<String, dynamic> json) => _$QuotesModelFromJson(json);




//    Map<String, dynamic> toJson() => _$QuotesModelToJson(this);
// }





//   // factory QuotesModel.fromJson(Map<String, dynamic> json) {
//   //   return QuotesModel(
//   //     text: json['content'],
//   //     author: json['author'],
//   //   );
//   // }
