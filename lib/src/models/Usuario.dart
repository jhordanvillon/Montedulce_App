class UsuarioModel {

  final String nombreCompleto;
  final String email;
  final String adminNameRole;

  UsuarioModel({this.nombreCompleto,this.email,this.adminNameRole});

  factory UsuarioModel.fromJson(Map<String,dynamic> json){
    return UsuarioModel(
      nombreCompleto: json['nombreCompleto'],
      email: json['email'],
      adminNameRole: json['adminNameRole'],
    );
  }

}