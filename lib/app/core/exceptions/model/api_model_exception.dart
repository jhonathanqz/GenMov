import 'package:json_annotation/json_annotation.dart';

part 'api_model_exception.g.dart';

@JsonSerializable()
class ApiModelException {
  @JsonKey(name: 'message')
  final String? message;

  ApiModelException({
    this.message,
  });

  factory ApiModelException.fromJson(Map<String, dynamic> json) =>
      _$ApiModelExceptionFromJson(json);
  Map<String, dynamic> toJson() => _$ApiModelExceptionToJson(this);
}
