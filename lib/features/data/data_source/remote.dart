import 'package:dio/dio.dart';

import '../../../core/exception/exception.dart';
import '../models/weather_models.dart';
abstract class WeatherNetworkDataSource {
  Future<WeatherModel> getWeather();
  factory WeatherNetworkDataSource() => _WeatherNetworkDataSource();
}

class _WeatherNetworkDataSource implements WeatherNetworkDataSource {
  final dio = Dio(BaseOptions(baseUrl: "https://api.weatherapi.com/v1"));
  @override
  Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
          "/current.json?key=2268565f833043f6898125351242001&q=Tashkent&aqi=no");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException(
            message: response.statusMessage ?? '',
            code: "${response.statusCode ?? ''}");
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(
          message: "Something went wrong", code: "140");
    }
  }
}
