part of 'package:crypto_app/view/trade/trade_view.dart';

class _AppBar extends StatelessWidget {
  const _AppBar({required this.symbol});
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Text(
            symbol,
            style: const TextStyle(
                color: Color(0xFFB358D7), fontSize: 20, fontWeight: FontWeight.bold),
          ),

        ],
      ),
    );
  }
}
