
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
