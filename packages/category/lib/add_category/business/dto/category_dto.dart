class CategoryDTO {
  String name;
  String icon;

  CategoryDTO({
    required this.name,
    required this.icon,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };

  CategoryDTO.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        icon = json["icon"];
}
