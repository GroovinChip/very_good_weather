import 'package:freezed_annotation/freezed_annotation.dart';

part 'parent.freezed.dart';
part 'parent.g.dart';

@freezed
class Parent with _$Parent {
  const factory Parent({
    String? title,
    String? location_type,
    String? latt_long,
    int? woeid,
  }) = _Parent;

  factory Parent.fromJson(Map<String, dynamic> json) =>
    _$ParentFromJson(json);
}