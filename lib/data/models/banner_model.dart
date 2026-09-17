class BannerModel {
  final String id;
  final String title;
  final String subtitle;
  final String actionLabel;
  final String? imageAsset;

  const BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.actionLabel = 'Explore Now',
    this.imageAsset,
  });
}
