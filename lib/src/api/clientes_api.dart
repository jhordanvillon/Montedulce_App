import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/models/clientes.dart';
import 'package:montedulce_integrador/src/service/auth.dart';


class ClientesApi{

  ClientesApi._internal();
  static ClientesApi _instance = ClientesApi._internal();
  static ClientesApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Clientes',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future ListarCliente() async{
    
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map(
          (obj) => Cliente.fromJson(obj)
        ).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }
  }
}