part of 'package:crypto_app/view/Profile/profile_view.dart';


class _GridView extends StatelessWidget {
  const _GridView({required this.walletViewModel});
  final WalletViewModel walletViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: MasonryGridView.count(
          itemCount: walletViewModel.appTransaction.length, // Updated itemCount
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemBuilder: (context, index) {
            Transaction transaction = walletViewModel.appTransaction[index]; // Get the transaction at the current index
            return Stack(
              children: [
                Container(
                  height: transaction.amount > 1 ? 170 : 130,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.symbol.toString().replaceAll("USDT", ""),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Amount:",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              transaction.amount.toString().substring(0, 4),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Date: ${transaction.transactionDate}", // Replace with the appropriate date property from your model
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 15,
                  child: coinLogos.contains(transaction.symbol)
                      ? SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/logo/${transaction.symbol}.png',
                    ),
                  )
                      : SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/logo/UNKNOWN.png',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
