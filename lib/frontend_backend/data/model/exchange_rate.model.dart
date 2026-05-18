class ExchangeRateModel {
  final int id;
  final String currencyCode;
  final String currencyName;
  final bool isDefault;
  final double rate;
  final String symbol;
  final String updatedAt;
  final double defaultRate;

  ExchangeRateModel({
    required this.id,
    required this.currencyCode,
    required this.currencyName,
    required this.isDefault,
    required this.rate,
    required this.symbol,
    required this.updatedAt,
    required this.defaultRate,
  });
}
