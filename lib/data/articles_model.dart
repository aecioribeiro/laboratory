import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_model.freezed.dart';
part 'articles_model.g.dart';

@freezed
class ArticlesResponse with _$ArticlesResponse {
  factory ArticlesResponse({
    List<ArticlesModel>? articles,
    int? totalResults,
    String? error,
  }) = _ArticlesReponse;

  factory ArticlesResponse.fromJson(Map<String, Object?> json) =>
      _$ArticlesResponseFromJson(json);
}

@freezed
class ArticlesModel with _$ArticlesModel {
  factory ArticlesModel({
    String? author,
    String? title,
    String? description,
    String? urlToImage,
    String? publishedAt,
  }) = _ArticlesModel;

  factory ArticlesModel.fromJson(Map<String, Object?> json) =>
      _$ArticlesModelFromJson(json);
}
