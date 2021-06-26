import 'package:dio/dio.dart';
import 'package:montedulce_integrador/src/models/ItemBoleta.dart';
import 'package:montedulce_integrador/src/models/pedido.dart';
import 'package:montedulce_integrador/src/service/auth.dart';

class PedidoApi{

  PedidoApi._internal();
  static PedidoApi _instance = PedidoApi._internal();
  static PedidoApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Pedido',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future<bool> crearPedido({String codigoPago, String tipoPedido, List<Item> item}) async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;
    List<Map<String,dynamic>> data = [];
    for (var i in item) {
      data.add({
        "productoId": i.productoId,
        "cantidad": i.cantidad
      });
    }
    try{
      final Response response = await this._dio.post("/",data: {
        "codigoPago": codigoPago ,
        "tipoPedido": tipoPedido,
        "items":  data,
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

  Future ListarPedido() async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/token",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map(
          (obj) => Pedido.fromJson(obj)
        ).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }
}

  Future PedidosAdmin() async{
    final token = await Auth.instance.accessToken;
    final tokenReal = "Bearer " + token ;

    try{
      final Response response = await this._dio.get("/",options: Options(headers: {"Authorization":tokenReal}));
      print(response.data);
      
      if(response.statusCode == 200){
        final List<dynamic> listaProducto = response.data;
        return listaProducto.map(
          (obj) => Pedido.fromJson(obj)
        ).toList();
      }
      return false;
    }catch(e){
      print(e);
      return [];
    }
}

}