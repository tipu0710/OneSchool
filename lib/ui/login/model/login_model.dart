import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @HiveField(0) required String username,
    @HiveField(1) required String password,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
