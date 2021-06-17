import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/service/auth.dart';

class ProductoApi{

  ProductoApi._internal();
  static ProductoApi _instance = ProductoApi._internal();
  static ProductoApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Producto',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );


  Future<bool> crearProducto({String nombre,String descripcion,double precio}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    try{
      final Response response = await this._dio.post("/",data: {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Precio": precio,
      },options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      if(response.statusCode == 200){
        return true;
      }
      return false;
    }catch(e){
      return false;
    }
  }

  


}