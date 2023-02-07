class CategoryDTO {
  String id;
  String name;
  String? icon;

  CategoryDTO({
    required this.id,
    required this.name,
    this.icon,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        if (icon != null) "icon": icon,
      };

  CategoryDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        icon = json["icone"];
}
