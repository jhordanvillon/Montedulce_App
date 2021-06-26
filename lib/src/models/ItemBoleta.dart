import 'dart:convert';

Boleta boletaFromJson(String str) => Boleta.fromJson(json.decode(str));

String boletaToJson(Boleta data) => json.encode(data.toJson());

class Boleta {
    Boleta({
        this.items,
    });

    List<Item> items;

    factory Boleta.fromJson(Map<String, dynamic> json) => Boleta(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.productoId,
        this.cantidad,
    });

    String productoId;
    int cantidad;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productoId: json["productoId"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "cantidad": cantidad,
    };
}
