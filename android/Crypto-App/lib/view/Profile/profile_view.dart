import 'dart:ui';

import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:crypto_app/view_model/wallet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:crypto_app/service/binance/profile_service.dart';
import '../../model/Profile.dart';
import '../../model/Transaction.dart';
import '../../model/market_model.dart';
import '../../utils/constants.dart';

part 'components/grid_view.dart';
part 'components/profile_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>  {
  late Future<Profile> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        SafeArea(
          child: Consumer<MarketViewModel>(
              builder: (context, marketViewModel, index) {
                return Consumer<WalletViewModel>(
                    builder: (context, walletViewModel, index) {
                      return StreamBuilder(
                          stream: marketViewModel.getMarketData(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List<Market> market = snapshot.data;
                              for (var e in walletViewModel.appWallet) {
                                marketViewModel.money = e.amount.toDouble() *
                                    double.parse(market[0].lastPrice);
                              }
                              return Scaffold(
                                backgroundColor: Colors.transparent,

                                body: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 30),
                                        child: Stack(
                                          children: [
                                            _backdropFilter(),
                                           _ProfileCard(
                                                profile: _profileFuture,
                                                ),
                                          ],
                                        )),

                                    _assetsLabel(walletViewModel),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    _GridView(walletViewModel: walletViewModel),
                                  ],
                                ),
                              );
                            } else {
                              return Center(

                              );
                            }
                          });
                    });
              }),
        ),
      ],
    );
  }

  BackdropFilter _backdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pink.jpg'), // Replace the path with your image
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
      ),
    );
  }

  Padding _assetsLabel(WalletViewModel walletViewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Text(
            "My Transactions",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          const SizedBox(width: 15),
          Text(
            '( ${walletViewModel.appTransaction.length.toString()} )',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }



}
