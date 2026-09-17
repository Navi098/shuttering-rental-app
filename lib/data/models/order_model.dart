class OrderModel {
  final String id;
  final int itemCount;
  final double total;
  final String status;
  final DateTime createdAt;

  const OrderModel({
    required this.id,
    required this.itemCount,
    required this.total,
    required this.status,
    required this.createdAt,
  });
}
