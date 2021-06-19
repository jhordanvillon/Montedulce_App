import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Extras{
  static pickImage(bool fromCamera) async{
    final ImagePicker picker = ImagePicker();
    final PickedFile file= await picker.getImage(source: fromCamera?ImageSource.camera:ImageSource.gallery);
      return file;
  }

  static getFileName(String path){
    return basename(path);
  }
}