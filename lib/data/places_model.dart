import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_model.freezed.dart';
part 'places_model.g.dart';

@freezed
class PlacesModel with _$PlacesModel {
  factory PlacesModel({
    int? id,
    String? title,
    String? createdAt,
    String? lat,
    String? lng,
  }) = _PlacesModel;

  factory PlacesModel.fromJson(Map<String, Object?> json) =>
      _$PlacesModelFromJson(json);
}

@freezed
class PlacesResponse with _$PlacesResponse {
  factory PlacesResponse({
    List<PlacesModel>? places,
  }) = _PlacesResponse;

  factory PlacesResponse.fromJson(Map<String, Object?> json) =>
      _$PlacesResponseFromJson(json);
}
