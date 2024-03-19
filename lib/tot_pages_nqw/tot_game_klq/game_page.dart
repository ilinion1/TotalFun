import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_app_convert_oow.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_app_bar_rrt.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_coins_container_iiq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_time_container_nqe.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_lose_page_ere.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_positiones_ljan.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_win_page_lnq.dart';

class TOTGamePageIIQ extends StatefulWidget {
  final int level;
  const TOTGamePageIIQ({
    super.key,
    required this.level,
  });

  @override
  State<TOTGamePageIIQ> createState() => _TOTGamePageIIQState();
}

class _TOTGamePageIIQState extends State<TOTGamePageIIQ> {
  int _currentCoins = 0;
  late Timer periodicTimer;
  int time = 90;
  bool isPause = false;
  List<List<int>> _selectIndex = [[], [], [], []];
  List<List<int>> _takedIndex = [[], [], [], []];
  List<BasePosition> currentInButton = [];

  List<int> _itemForPolse = [-1, -1, -1, -1];

  bool canTap = true;

  late final List<List<BasePosition>> _positions;

  @override
  void initState() {
    if (widget.level == 0) {
      _positions = getPos0().cast<List<BasePosition>>();
    }
    if (widget.level == 1) {
      _positions = getPos1().cast<List<BasePosition>>();
    }
    if (widget.level == 2) {
      _positions = getPos2().cast<List<BasePosition>>();
    }
    if (widget.level == 3) {
      _positions = getPos3().cast<List<BasePosition>>();
    }
    if (widget.level == 4) {
      _positions = getPos4().cast<List<BasePosition>>();
    }
    if (widget.level == 5) {
      _positions = getPos5().cast<List<BasePosition>>();
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        useTimer();
      },
    );
    super.initState();
  }

  void useTimer() {
    periodicTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!isPause) {
          if (time == 0) {
            setState(() {
              timer.cancel();
            });
            lose();
          } else {
            setState(() {
              time--;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    periodicTimer.cancel();
    super.dispose();
  }

  void onItemTap(int firstIndex, int secondIndex) {
    if (canTap) {
      _selectIndex[firstIndex].add(secondIndex);
      if ((_selectIndex[0].length +
              _selectIndex[1].length +
              _selectIndex[2].length +
              _selectIndex[3].length) >=
          7) {
        lose();
      }
      checkFill();

      canTap = false;
      _itemForPolse[firstIndex] = secondIndex;
      currentInButton.add(BasePosition(firstIndex, secondIndex));
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          setState(() {
            _takedIndex[firstIndex].add(secondIndex);
            checkWin();

            canTap = true;
            _itemForPolse[firstIndex] = -1;
          });
        },
      );

      setState(() {});
    }
  }

  checkWin() {
    if ((_takedIndex[0].length >= 4) &&
        _takedIndex[1].length >= 4 &&
        _takedIndex[2].length >= 4 &&
        _takedIndex[3].length >= 4) {
      TOTAppConvertNQE.totchangeCoinsNQE(_currentCoins * 10, context);
      context.read<BaseBloc>().add(
            const BaseEvent.started(),
          );
      Nav.pushPage(
        TOTWinPageNCA(
          level: widget.level,
          newCoins: _currentCoins * 10,
        ),
        context,
      );
    }
  }

  void lose() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        Nav.pushPage(TOTLosePageMQD(level: widget.level), context);
      },
    );
  }

  bool checkFill() {
    bool result = false;

    for (int i = 0; i < 4; i++) {
      if (_selectIndex[i].length > 3) {
        result = true;
        setState(() {
          _currentCoins += 10;
          Future.delayed(const Duration(microseconds: 2), () {
            _selectIndex[i] = [];
            List<BasePosition> vario =
                currentInButton.where((element) => element.X == i).toList();
            vario.forEach(
              (element) {
                currentInButton.remove(element);
              },
            );
            _selectIndex[i].clear();
          });
          setState(() {});
        });
      }
    }

    return result;
  }

  List<Widget> getItemOnResult() {
    List<Widget> results = [];
    List<String> pickNames = [];
    if ((_selectIndex[0].length +
            _selectIndex[1].length +
            _selectIndex[2].length +
            _selectIndex[3].length) >=
        7) {
      // lose();
      return [];
    } else {
      if (1 == 2) {
      } else {
        // for (int i = 0; i < 4; i++) {
        //   currentInButton.where((element) => element.X == i).forEach(
        //     (element) {
        //       pickNames.add("assets/images/item_${widget.level}_$i.png");
        //     },
        //   );
        // }
        currentInButton.forEach(
          (element) {
            pickNames
                .add("assets/images/item_${widget.level}_${element.X}.png");
          },
        );
        for (int i = 0; i < 7; i++) {
          if (pickNames.length > i) {
            results.add(
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xff3838B3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 48.r,
                  width: 48.r,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: ShakeY(
                      from: 20.r,
                      child: Image.asset(
                        pickNames[i],
                        height: 30.r,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            results.add(
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xff30306D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 48.r,
                  width: 48.r,
                ),
              ),
            );
          }
        }
      }
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 60.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: TOTBaseAppBarPPO(
                  title: "Level ${widget.level + 1}",
                  showSettings: true,
                  onSettingsTap: () => setState(() {
                    isPause = true;
                  }),
                  onSettingsEnd: () => setState(() {
                    isPause = false;
                  }),
                ),
              ),
              SizedBox(height: 20.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TOTCoinsContainerYWB(
                      coins: _currentCoins,
                    ),
                    TOTTimeContainerOJE(
                      time: time,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: SizedBox(
              height: 440.r,
              width: double.infinity,
              child: Stack(
                children: [
                  for (int i = 0; i < 4; i++)
                    Positioned(
                      top: _positions[1][i].Y.toDouble(),
                      left: _positions[1][i].X.toDouble(),
                      child: _takedIndex[1].contains(i)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => onItemTap(1, i),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xff3838B3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Pulse(
                                  animate: _itemForPolse[1] == i,
                                  child: SizedBox(
                                    height: 48.r,
                                    width: 48.r,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: Image.asset(
                                        "assets/images/item_${widget.level}_1.png",
                                        height: 30.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  for (int i = 0; i < 4; i++)
                    Positioned(
                      top: _positions[0][i].Y.toDouble(),
                      left: _positions[0][i].X.toDouble(),
                      child: _takedIndex[0].contains(i)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => onItemTap(0, i),
                              child: Pulse(
                                animate: _itemForPolse[0] == i,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3838B3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    height: 48.r,
                                    width: 48.r,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: Image.asset(
                                        "assets/images/item_${widget.level}_0.png",
                                        height: 30.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  for (int i = 0; i < 4; i++)
                    Positioned(
                      top: _positions[2][i].Y.toDouble(),
                      left: _positions[2][i].X.toDouble(),
                      child: _takedIndex[2].contains(i)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => onItemTap(2, i),
                              child: Pulse(
                                animate: _itemForPolse[2] == i,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3838B3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    height: 48.r,
                                    width: 48.r,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: Image.asset(
                                        "assets/images/item_${widget.level}_2.png",
                                        height: 30.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  for (int i = 0; i < 4; i++)
                    Positioned(
                      top: _positions[3][i].Y.toDouble(),
                      left: _positions[3][i].X.toDouble(),
                      child: _takedIndex[3].contains(i)
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => onItemTap(3, i),
                              child: Pulse(
                                animate: _itemForPolse[3] == i,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3838B3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    height: 48.r,
                                    width: 48.r,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.r),
                                      child: Image.asset(
                                        "assets/images/item_${widget.level}_3.png",
                                        height: 30.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                ],
              ),
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xff5C5CAB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                children: [
                  SizedBox(height: 16.r),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 24.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: TOTAppColorsPOA.background,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: (((MediaQuery.of(context).size.width - 32.r) /
                                      4) *
                                  _currentCoins ~/
                                  10)
                              .toDouble(),
                          height: 24.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: TOTAppColorsPOA.pinc,
                          ),
                        ),
                      ),
                      if (_currentCoins != 0)
                        Center(
                          child: Text(
                            'X${(_currentCoins ~/ 10)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10.r),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: getItemOnResult(),
                  ),
                  SizedBox(height: 30.r),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BasePosition {
  final int X;
  final int Y;

  BasePosition(this.X, this.Y);
}
