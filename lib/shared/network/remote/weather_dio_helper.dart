import 'package:dio/dio.dart';

class WeatherDioHelper
{

  static Dio? dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.weatherapi.com/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getWeatherData({
    required String url,
    Map<String,dynamic>? query,
  }) async
  {
    dio!.options.headers = {
      'Content-Type' : 'application/json',
    };
    var response =  await dio!.get(
      url ,
      queryParameters: query,
    );
    return  response;
  }
}