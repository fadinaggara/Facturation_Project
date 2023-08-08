class Order {
  final String id;
  final String name;
  final DateTime date;
  final double amount;

  Order(
      {required this.id,
      required this.name,
      required this.date,
      required this.amount});
}