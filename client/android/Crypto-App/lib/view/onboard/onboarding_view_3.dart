import 'package:flutter/material.dart';

import '../../utils/constants.dart';


class OnBoardingView3 extends StatefulWidget {
  const OnBoardingView3({super.key});

  @override
  State<OnBoardingView3> createState() => _OnBoardingView3State();
}

class _OnBoardingView3State extends State<OnBoardingView3>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: DurationConstants.lottieMedium());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/bla.png',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            "Realtime Data",
            style: onBoardTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Track your cryptocurrency portfolio in realtime.",
                style: onBoardDescription,
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
