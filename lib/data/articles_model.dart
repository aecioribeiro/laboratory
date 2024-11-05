import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_model.freezed.dart';
part 'articles_model.g.dart';

@freezed
class ArticlesModel with _$ArticlesModel {
  factory ArticlesModel({
    String? author,
    String? title,
    String? description,
    String? image,
    String? date,
  }) = _ArticlesModel;

  factory ArticlesModel.fromJson(Map<String, Object?> json) =>
      _$ArticlesModelFromJson(json);
}
