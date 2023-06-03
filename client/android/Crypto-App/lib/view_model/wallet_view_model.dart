import 'package:crypto_app/model/Transaction.dart';
import 'package:flutter/cupertino.dart';

import '../model/wallet.dart';
import '../model/Transaction.dart';
class WalletViewModel extends ChangeNotifier {
  num _totalBalance = 110;
  final List<Wallet> _appWallet = [];
  final List<Transaction> _appTransaction = [];
  num get totalBalance => _totalBalance;

  List<Wallet> get appWallet => _appWallet;
 List <Transaction> get appTransaction => _appTransaction;

  void changeTotalBalance(num newBalance) {
    _totalBalance += newBalance;
    notifyListeners();
  }
}