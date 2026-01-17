class Product {
  final String id;
  final String nameEn;
  final String nameAr;
  final double priceLBP;
  final double priceUSD;
  final String unit;
  final bool available;

  Product({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.priceLBP,
    required this.priceUSD,
    required this.unit,
    required this.available,
  });
}
