class CopyItem {
  final String copyId;
  final String gameId;
  final String status; // Owned | ForSale | ForTrade | Wish
  final String condition; // Mint | Good | Fair
  final String completeness; // CIB | Loose | DiscOnly
  final String location;
  final double? pricePaid;
  final double? estMarketValue;

  CopyItem({
    required this.copyId,
    required this.gameId,
    required this.status,
    required this.condition,
    required this.completeness,
    required this.location,
    this.pricePaid,
    this.estMarketValue,
  });
}
