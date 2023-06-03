import 'dart:ui';

import 'package:crypto_app/model/candle_model.dart';
import 'package:crypto_app/view_model/market_view_model.dart';
import 'package:crypto_app/view_model/trade_view_model.dart';
import 'package:crypto_app/view_model/wallet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/Transaction.dart';
import '../../model/market_model.dart';
import '../../model/wallet.dart';
import '../../utils/constants.dart';

part 'components/price_label.dart';
part 'components/app_bar.dart';
part 'components/interval_buttons.dart';
part 'components/chart.dart';
part 'components/info_body.dart';
part 'components/trade_buttons.dart';

class TradeView extends StatefulWidget {
  const TradeView(
      {super.key,
      required this.index,
      required this.symbol,
      required this.marketViewModel,
      required this.tradeViewModel,
      required this.walletViewModel});
  final int index;
  final String symbol;
  final MarketViewModel marketViewModel;
  final TradeViewModel tradeViewModel;
  final WalletViewModel walletViewModel;

  @override
  State<TradeView> createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView>  {

  @override
  void initState() {
    for (var element in widget.walletViewModel.appWallet) {
      if (element.symbol == widget.symbol) {
        widget.tradeViewModel.changeTitle(element.amount);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: StreamBuilder(
                  stream: widget.marketViewModel.getMarketData(),
                  builder: (context, AsyncSnapshot marketSnapshot) {
                    return StreamBuilder(
                        stream:
                            widget.tradeViewModel.getCandleData(widget.symbol),
                        builder: (context, AsyncSnapshot tradeSnapshot) {
                          if (marketSnapshot.hasData && tradeSnapshot.hasData) {
                            List<Market> market = marketSnapshot.data;

                            List<Candle> candle = tradeSnapshot.data;
                            return Column(
                              children: [
                                _AppBar(symbol: widget.symbol),
                                _PriceLabel(
                                    market: market, index: widget.index),
                                _IntervalButtons(
                                    tradeViewModel: widget.tradeViewModel),
                                _Chart(
                                    tradeViewModel: widget.tradeViewModel,
                                    candle: candle),
                                _InfoBody(candle: candle),
                                _TradeButtons(
                                    index: widget.index,
                                    symbol: widget.symbol,
                                    tradeViewModel: widget.tradeViewModel,
                                    marketViewModel: widget.marketViewModel,
                                    walletViewModel: widget.walletViewModel)
                              ],
                            );
                          } else {
                            return Center(

                            );
                          }
                        });
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
