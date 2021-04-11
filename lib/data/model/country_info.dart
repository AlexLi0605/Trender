import 'package:json_annotation/json_annotation.dart';

part 'country_info.g.dart';

@JsonSerializable()
class CountryInfo {
  String name;
  String code;

  CountryInfo({
    this.name,
    this.code,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);
}
