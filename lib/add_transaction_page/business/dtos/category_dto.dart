class CategoryDTO {
  String id;
  String name;
  String? icon;

  CategoryDTO({
    required this.id,
    required this.name,
    this.icon,
  });
}
