// To parse this JSON data, do
//
//     final pedido = pedidoFromJson(jsonString);

import 'dart:convert';

List<Pedido> pedidoFromJson(String str) => List<Pedido>.from(json.decode(str).map((x) => Pedido.fromJson(x)));

String pedidoToJson(List<Pedido> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedido {
    Pedido({
        this.pedidoId,
        this.boletaId,
        this.boleta,
        this.usuarioId,
        this.usuario,
        this.codigoPago,
        this.tipoPedido,
        this.fechaCreacion,
    });

    String pedidoId;
    String boletaId;
    dynamic boleta;
    String usuarioId;
    dynamic usuario;
    String codigoPago;
    String tipoPedido;
    DateTime fechaCreacion;

    static Pedido fromJson(Map json) => Pedido(
        pedidoId: json["pedidoId"],
        boletaId: json["boletaId"],
        boleta: json["boleta"],
        usuarioId: json["usuarioId"],
        usuario: json["usuario"],
        codigoPago: json["codigoPago"],
        tipoPedido: json["tipoPedido"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
    );

    Map<String, dynamic> toJson() => {
        "pedidoId": pedidoId,
        "boletaId": boletaId,
        "boleta": boleta,
        "usuarioId": usuarioId,
        "usuario": usuario,
        "codigoPago": codigoPago,
        "tipoPedido": tipoPedido,
        "fechaCreacion": fechaCreacion.toIso8601String(),
    };
}
