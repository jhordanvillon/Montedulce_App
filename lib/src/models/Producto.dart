class Producto {
    Producto({
        this.productoId,
        this.nombre,
        this.descripcion,
        this.imgLink,
        this.imgId,
        this.precio,
        this.categoriaId,
    });

    String productoId;
    String nombre;
    String descripcion;
    dynamic imgLink;
    dynamic imgId;
    double precio;
    String categoriaId;

    static Producto fromJson(Map json){
      return Producto(
        productoId: json["productoId"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imgLink: json["imgLink"],
        imgId: json["imgId"],
        precio: json["precio"],
        categoriaId: json["categoriaId"],
      );
    }
     
}
