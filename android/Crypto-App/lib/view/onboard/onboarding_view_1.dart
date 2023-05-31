import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingView1 extends StatefulWidget {
  const OnBoardingView1({Key? key}) : super(key: key);

  @override
  State<OnBoardingView1> createState() => _OnBoardingView1State();
}

class _OnBoardingView1State extends State<OnBoardingView1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set a fixed height for the container or adjust it as needed
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/logofinal.png',
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Build your future',
              style: onBoardTitle,
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Start investing today and your future will change for the better.',
                style: onBoardDescription,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
