import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingView2 extends StatefulWidget {
  const OnBoardingView2({super.key});

  @override
  State<OnBoardingView2> createState() => _OnBoardingView2State();
}

class _OnBoardingView2State extends State<OnBoardingView2>
     {





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/wallet.png',
              fit: BoxFit.cover,
            ),
          ),
          const Text("Encrypted Wallet",
              style: onBoardTitle),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Keep your investment safe with our encrypted wallet.",
                style: onBoardDescription,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
