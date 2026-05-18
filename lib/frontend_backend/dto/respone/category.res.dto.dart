class CategoryResDto {
  final int id;
  final String description;
  final String imageUrl;
  final String name;
  final String slug;
  final bool status;

  CategoryResDto({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.slug,
    required this.status,
  });
}
