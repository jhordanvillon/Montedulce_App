class Cliente {
    Cliente({
        this.id,
        this.email,
        this.nombreCompleto,
        this.adminNameRole,
    });

    String id;
    String email;
    String nombreCompleto;
    String adminNameRole;

    static Cliente fromJson(Map json) {
      return Cliente(
        id: json["id"],
        email: json["email"],
        nombreCompleto: json["nombreCompleto"],
        adminNameRole: json["adminNameRole"]);
    }
}
