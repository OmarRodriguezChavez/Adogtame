import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:proyectofinal_cont_rdz/models/raza_model.dart';

class ApiBreed {

  final dio = Dio();
  //DioCacheManager dioCacheManager=DioCacheManager();

Future<List<BreedModel>?> getHttp() async {

  /*try {
      Response response = await dio.get("https://api.thedogapi.com/v1/breeds/",
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true, ),);
      return (response.data as List)
          .map((x) => BreedModel.fromMap(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }*/

    String url='https://api.thedogapi.com/v1/breeds/';
    try{
      Dio dio=Dio();
      DioCacheManager dioCacheManager=DioCacheManager(CacheConfig());
      Options myoptions=buildCacheOptions(const Duration(days: 7), forceRefresh: true);
      dio.interceptors.add(dioCacheManager.interceptor);
      var res=await dio.get(url, options: myoptions);
      return (res.data as List)
          .map((x) => BreedModel.fromMap(x))
          .toList();
    }catch(e)
    {
      if(e is SocketException){
        return null;
      }
    }

}
 
}
  