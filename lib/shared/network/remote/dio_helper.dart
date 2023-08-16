import 'package:dio/dio.dart';
import 'package:news_app/shared/component/constance.dart';

class DioHelper{
  static Dio? dio;

  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
})
  async{
    return await dio!.get(url,queryParameters: query);
  }
}