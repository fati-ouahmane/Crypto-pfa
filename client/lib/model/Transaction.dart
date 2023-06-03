import 'dart:convert';

class Transaction {
  final String symbol;
  num amount;
  num price;
  DateTime? transactionDate; // Updated type to DateTime?

  Transaction(this.symbol, this.amount, this.price, this.transactionDate);

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'amount': amount,
      'price': price,
      'transactionDate': transactionDate?.toIso8601String(),
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      map['symbol'] ?? '',
      map['amount'] ?? 0,
      map['price'] ?? 0,
      map['transactionDate'] != null ? DateTime.parse(map['transactionDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source));
}
