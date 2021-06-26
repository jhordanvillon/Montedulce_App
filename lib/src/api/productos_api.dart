import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/models/photo.dart';
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


  Future<bool> crearProducto({String nombre,String descripcion,double precio, String categoriaId,int stock, PhotoModel model}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    try{
      final Response response = await this._dio.post("/",data: {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Precio": precio,
        "CategoriaId": categoriaId,
        "Stock": stock,
        "ImgLink": model.secureUrl,
        "ImgId": model.publicId
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

  Future<bool> editarProducto({String nombre,String descripcion,double precio, String categoriaId,int stock,String id}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    try{
      final Response response = await this._dio.put("/$id",data: {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Precio": precio,
        "CategoriaId": categoriaId,
        "Stock": stock,
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

  Future buscarProducto({String nombre}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/$nombre",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map(
          (obj) => Producto.fromJson(obj)
        ).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }

  }

  Future ListarProducto() async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/",options: Options(headers: {"Authorization":tokenReal}));
      //print(response.data);
      
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map(
          (obj) => Producto.fromJson(obj)
        ).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }

    

  }

  

  Future<bool> eliminarProducto({String id}) async{
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