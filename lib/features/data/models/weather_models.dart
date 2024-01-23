import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/weather_entity.dart';

part 'weather_models.g.dart';

@JsonSerializable()
class WeatherModel extends WeatherEntity {
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "current")
  final Current current;
  const WeatherModel({
    required this.location,
    required this.current,
  }) : super(location: location, current: current);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "region", defaultValue: "")
  final String region;
  @JsonKey(name: "country", defaultValue: "")
  final String country;
  @JsonKey(name: "localtime", defaultValue: "")
  final String localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "temp_c", defaultValue: 0.0)
  final double tempC;
  @JsonKey(name: "temp_f", defaultValue: 0.0)
  final double tempF;
  @JsonKey(name: "is_day", defaultValue: 0)
  final int isDay;
  @JsonKey(name: "condition")
  final Condition condition;
  @JsonKey(name: "wind_mph", defaultValue: 0.0)
  final double windMPH;
  @JsonKey(name: "wind_kph", defaultValue: 0.0)
  final double windKPH;
  @JsonKey(name: "wind_degree", defaultValue: 0)
  final int windDegree;
  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMPH,
    required this.windKPH,
    required this.windDegree,
  });
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  @JsonKey(name: "text", defaultValue: "")
  final String text;
  @JsonKey(name: "icon", defaultValue: "")
  final String icon;
  Condition({
    required this.text,
    required this.icon,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
