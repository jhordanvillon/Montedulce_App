import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/Usuario.dart';
import 'package:montedulce_integrador/src/service/auth.dart';
import 'package:montedulce_integrador/src/utils/dialogs.dart';

class AuthenticationApi {
  AuthenticationApi._internal();
  static AuthenticationApi _instance = AuthenticationApi._internal();
  static AuthenticationApi get instance => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://montedulce.azurewebsites.net/api/Usuario',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_) => true,
    ),
  );

  Future<dynamic> refresh(String expiredToken) async {
    try {
      final Response response = await this._dio.post(
            '/refresh-token',
            options: Options(headers: {
              'Auth': expiredToken,
            }),
          );
      if (response.statusCode == 403) {
        return null;
      }
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UsuarioModel> login({@required BuildContext context,@required String email,@required String password}) async {

    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post('/login', data: {"email": email, "password": password});
      progressDialog.dismiss();
      print(response.data);
      if (response.statusCode == 200) {
        await Auth.instance.setSession(response.data);
        final user = UsuarioModel.fromJson(response.data);
        return user;
      }
      return null;
    } catch (error) {
      progressDialog.dismiss();
      return null;
    }
  }

  Future<UsuarioModel> registrar(
      {@required BuildContext context,
      @required String nombre,
      @required String apellidos,
      @required String password,
      @required String email,
      @required String username,
      @required String adminNameRole,
      }) async {
      final ProgressDialog progressDialog = ProgressDialog(context);
      try {
        progressDialog.show();
        final Response response = await this._dio.post('/registrar', data: {
          "Nombre": nombre,
          "Email": email,
          "Password": password,
          "Username": username,
          "Apellidos": apellidos,
          "AdminNameRole": adminNameRole,
        });
        progressDialog.dismiss();
        if (response.statusCode == 200) {
          await Auth.instance.setSession(response.data);
          final user = UsuarioModel.fromJson(response.data);
          return user;
        } else {
          Dialogs.info(context,
              title: 'Error',
              content: response.data['msg'],
              onPressed: () => {Navigator.pop(context)});
          return null;
        }
      } catch (error) {}
    }
}
 