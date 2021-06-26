import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/models/boleta.dart';
import 'package:montedulce_integrador/src/service/auth.dart';

class BoletaApi{

  BoletaApi._internal();
  static BoletaApi _instance = BoletaApi._internal();
  static BoletaApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Boleta',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  
  Future<Boleta> obtenerBoleta({String idBoleta}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/$idBoleta",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      
      if(response.statusCode == 200){
        final boleta = Boleta.fromJson(response.data);
        return boleta;
      }
      return null;
    }catch(e){
      print(e);
      return null;
    }

}

}