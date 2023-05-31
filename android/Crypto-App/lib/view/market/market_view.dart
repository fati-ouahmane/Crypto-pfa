

import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../model/market_model.dart';
import '../../utils/constants.dart';


part 'components/app_bar.dart';
part 'components/market_data_card.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          appBar: const _AppBar(),
          backgroundColor: Colors.transparent,
          body: Consumer<MarketViewModel>(
            builder: (context, marketViewModel, child) {
              return StreamBuilder(
                stream: marketViewModel.getMarketData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Market> coins = snapshot.data;
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/remover.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 300,
                          width: 800,


                        ),

                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return _MarketDataCard(
                                  marketViewModel: marketViewModel,
                                  index: index,
                                  coins: coins);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 2),
                            itemCount: coins.length,
                          ),
                        ),
                      ],
                    );
                  }

                  return Center(
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

