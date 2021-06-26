// To parse this JSON data, do
//
//     final boleta = boletaFromJson(jsonString);

import 'dart:convert';

Boleta boletaFromJson(String str) => Boleta.fromJson(json.decode(str));

String boletaToJson(Boleta data) => json.encode(data.toJson());

class Boleta {
    Boleta({
        this.boletaId,
        this.items,
        this.fechaCreacion,
    });

    String boletaId;
    List<Item> items;
    DateTime fechaCreacion;

    factory Boleta.fromJson(Map<String, dynamic> json) => Boleta(
        boletaId: json["boletaId"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
    );

    Map<String, dynamic> toJson() => {
        "boletaId": boletaId,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "fechaCreacion": fechaCreacion.toIso8601String(),
    };
}

class Item {
    Item({
        this.itemBoletaId,
        this.cantidad,
        this.producto,
    });

    String itemBoletaId;
    int cantidad;
    Producto producto;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemBoletaId: json["itemBoletaId"],
        cantidad: json["cantidad"],
        producto: Producto.fromJson(json["producto"]),
    );

    Map<String, dynamic> toJson() => {
        "itemBoletaId": itemBoletaId,
        "cantidad": cantidad,
        "producto": producto.toJson(),
    };
}

class Producto {
    Producto({
        this.productoId,
        this.nombre,
        this.descripcion,
        this.imgLink,
        this.imgId,
        this.precio,
        this.stock,
        this.categoriaId,
        this.categoria,
    });

    String productoId;
    String nombre;
    String descripcion;
    dynamic imgLink;
    dynamic imgId;
    double precio;
    int stock;
    String categoriaId;
    dynamic categoria;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        productoId: json["productoId"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imgLink: json["imgLink"],
        imgId: json["imgId"],
        precio: json["precio"].toDouble(),
        stock: json["stock"].toInt(),
        categoriaId: json["categoriaId"],
        categoria: json["categoria"],
    );

    Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "nombre": nombre,
        "descripcion": descripcion,
        "imgLink": imgLink,
        "imgId": imgId,
        "precio": precio,
        "stock": stock,
        "categoriaId": categoriaId,
        "categoria": categoria,
    };
}
