import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/models/categoria.dart';
import 'package:montedulce_integrador/src/service/auth.dart';

class CategoriaApi{

  CategoriaApi._internal();
  static CategoriaApi _instance = CategoriaApi._internal();
  static CategoriaApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Categoria',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future<bool> crearCategoria({String nombre,String descripcion}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    try{
      final Response response = await this._dio.post("/",data: {
        "Nombre": nombre,
        "Descripcion": descripcion,
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

  Future<bool> editarCategoria({String nombre,String descripcion,String id}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    try{
      final Response response = await this._dio.put("/$id",data: {
        "Nombre": nombre,
        "Descripcion": descripcion,
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

  Future ListarCategoria() async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/",options: Options(headers: {"Authorization":tokenReal}));
      //print(response.data);
      
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map((obj) => Categoria.fromJson(obj)).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }

  }

  Future<bool> eliminarCategoria({String id}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.delete("/$id",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      
      if(response.statusCode == 200){
        return true;
      }
      return false;
    }catch(e){
      print(e);
      return false;
    }

  }


}