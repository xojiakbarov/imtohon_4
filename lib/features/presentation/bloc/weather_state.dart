part of 'weather_bloc.dart';

class WeatherState {
  final LoadingStatus status;
  final WeatherEntity? weatherEntity;
  WeatherState({
    required this.status,
    required this.weatherEntity,
  });

  WeatherState copyWith({
    LoadingStatus? status,
    WeatherEntity? weatherEntity,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weatherEntity: weatherEntity ?? this.weatherEntity,
    );
  }

  @override
  String toString() => 'WeatherState(status: $status, weatherEntity: $weatherEntity)';

  @override
  bool operator ==(covariant WeatherState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          other.weatherEntity == weatherEntity;
  }

  @override
  int get hashCode => status.hashCode ^ weatherEntity.hashCode;
}

enum LoadingStatus {
  pure,
  loading,
  failure,
  success,
}
