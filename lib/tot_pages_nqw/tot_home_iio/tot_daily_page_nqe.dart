import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_app_bar_rrt.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_coins_container_iiq.dart';
import 'package:n1/resources/resources.dart';

class TOTDailyPageQJD extends StatefulWidget {
  final Function(int newCoints) onGetReward;
  const TOTDailyPageQJD({
    super.key,
    required this.onGetReward,
  });

  @override
  State<TOTDailyPageQJD> createState() => _TOTDailyPageQJDState();
}

class _TOTDailyPageQJDState extends State<TOTDailyPageQJD> {
  int _select = -1;
  late int _newMoney;
  bool _showGitf = false;
  @override
  void initState() {
    int random = Random().nextInt(3);
    switch (random) {
      case 0:
        _newMoney = 50;
      case 1:
        _newMoney = 100;
      case 2:
        _newMoney = 50;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            return state.when(
              load: (coins, openLevels) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Column(
                    children: [
                      const TOTBaseAppBarPPO(
                        title: "Daily Reward",
                      ),
                      SizedBox(height: 10.r),
                      TOTCoinsContainerYWB(coins: coins),
                      Image.asset(Images.totBigPrizeWwr),
                      SizedBox(height: 16.r),
                      SizedBox(
                        height: 40.r,
                        child: Text(
                          !_showGitf
                              ? "Choose one of the cards and\nfind out your reward"
                              : "You Recieve:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xffFDA1FF),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.r),
                      _showGitf
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TOTCoinsContainerYWB(coins: _newMoney),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  GestureDetector(
                                    onTap: _select == -1
                                        ? () {
                                            setState(() {
                                              _select = i;
                                            });
                                            Future.delayed(
                                              const Duration(seconds: 1),
                                              () {
                                                widget.onGetReward(_newMoney);
                                                setState(() {
                                                  _showGitf = true;
                                                });
                                              },
                                            );
                                          }
                                        : null,
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: _select == i
                                            ? const Color(0xFF14AE5F)
                                            : TOTAppColorsPOA.pinc,
                                      ),
                                      child: giftContainer(
                                        70,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                    ],
                  ),
                );
              },
              initial: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

Widget giftContainer(double size) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: SizedBox(
      width: size.r,
      height: size.r,
      child: Center(
        child: Text(
          "?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 33.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
  );
}
