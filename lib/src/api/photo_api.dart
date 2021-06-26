import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:montedulce_integrador/src/models/photo.dart';
import 'package:montedulce_integrador/src/utils/dialogs.dart';
import 'package:montedulce_integrador/src/utils/extras.dart';

class PhotoAPI {
  PhotoAPI._internal();
  static PhotoAPI _instance = PhotoAPI._internal();
  static PhotoAPI get instance => _instance;

  final Dio _dio = new Dio();

  Future<PhotoModel> uploadPhoto(
      Uint8List bytes, String filePath, BuildContext context) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.show();
    try {
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(bytes,
            filename: Extras.getFileName(filePath))
      });
      final Response response = await this._dio.post(
          'https://api.cloudinary.com/v1_1/ddlg9esst/image/upload?upload_preset=bn94w0ky',
          data: formData,
          options: Options(headers: {'content-type': 'multipart/form-data'}));
      progressDialog.dismiss();
      PhotoModel photoModel = new PhotoModel(
          publicId: response.data['public_id'],
          secureUrl: response.data['secure_url']);
      return photoModel;
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response.data);
      }
      print("Error ${e.toString()}");
      return null;
    }
  }
}