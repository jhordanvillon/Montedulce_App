import 'Producto.dart';

class Categoria {
    Categoria({
        this.categoriaId,
        this.nombre,
        this.descripcion,
        this.productos,
    });

    String categoriaId;
    String nombre;
    String descripcion;
    List<Producto> productos;

    static Categoria fromJson(Map<String, dynamic> json) => Categoria(
        categoriaId: json["categoriaId"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        productos: List<Producto>.from(json["productos"].map((x) => Producto.fromJson(x))),
    );

}

