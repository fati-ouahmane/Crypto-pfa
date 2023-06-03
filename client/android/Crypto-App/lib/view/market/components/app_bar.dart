part of 'package:crypto_app/view/market/market_view.dart';
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GradientText(
                "cryptoxplorer",
                colors: [
                  Colors.white,
                  const Color(0xFFB358D7),
                  const Color(0xFF282159),
                ],
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
          Image.asset(
            'assets/images/logofinal.png', // Replace with your logo image path
            width: 180,
            height: 180,
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
