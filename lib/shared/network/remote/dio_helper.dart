import 'package:dio/dio.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = "http://192.168.2.1:8000/api/";

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> getData({
    required String endpoint,
    String? bearerToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio?.options.headers['Authorization'] = 'Bearer $bearerToken';
    var response = await dio!.get(
      '$baseUrl$endpoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> postData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? bearerToken,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    if (bearerToken != null) {
      dio!.options.headers['Authorization'] = 'Bearer $bearerToken';
    }

    Response response = await dio!.post('$baseUrl$endpoint', data: data);

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data. Status code: ${response.statusCode}');
    }
  }


  static Future<Map<String, dynamic>> deleteData({
    required String endpoint,
    String? bearerToken,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    dio!.options.headers['Authorization'] = 'Bearer $bearerToken';

    var response = await dio!.delete(
      '$baseUrl$endpoint',
      queryParameters: queryParameters,
    );

    if(response.statusCode == 404){
      showToast("", ToastState.ERROR);
    }

    return response.data;
  }

}