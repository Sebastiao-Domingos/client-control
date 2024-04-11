class Cliente {
  final String id;
  final String name;
  final String about;
  final String phone;
  final String address;
  final String company;
  final String picture;

  Cliente(
      {this.id = "",
      this.name = "",
      this.about = "",
      this.phone = "",
      this.address = "",
      this.company = "",
      this.picture = ""});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        phone: json["phone"],
        address: json["address"],
        company: json["company"],
        picture: json["picture"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "phone": phone,
        "company": company,
        "address": address,
        "picture": picture
      };
}

class Clientes {
  final List clientes;

  Clientes(this.clientes);
}
