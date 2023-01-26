class ParameterDetailPage {
  const ParameterDetailPage({
    required this.id,
    required this.title,
    required this.aggregateLikes,
    required this.instructions,
    required this.image,
  });

  final int id;
  final String title;
  final int aggregateLikes;
  final String instructions;
  final String image;
}
