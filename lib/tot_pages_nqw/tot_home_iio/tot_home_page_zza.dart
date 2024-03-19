import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_app_convert_oow.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_messages_nkq.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_coins_container_iiq.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_game_page_koq.dart';
import 'package:n1/tot_pages_nqw/tot_home_iio/tot_daily_page_nqe.dart';
import 'package:n1/tot_pages_nqw/tot_settings_uuq/tot_settings_page_ioq.dart';
import 'package:n1/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TOTHomePageOOQ extends StatefulWidget {
  const TOTHomePageOOQ({super.key});

  @override
  State<TOTHomePageOOQ> createState() => _TOTHomePageOOQState();
}

class _TOTHomePageOOQState extends State<TOTHomePageOOQ> {
  late SharedPreferences sharedPreferences;
  int? different;
  late Timer timer;
  int _currentLevel = 0;
  late PageController _pageController;
  final List<int> _coinPrize = [0, 220, 450, 600, 780, 900];

  @override
  void initState() {
    context.read<BaseBloc>().add(const BaseEvent.started());
    sharedPreferences = context.read<SharedPreferences>();

    String? lastTimeGiftString = sharedPreferences.getString("gift");
    _pageController = PageController(
      viewportFraction: 0.6,
      initialPage: 1,
    );
    _pageController.addListener(
      () {
        _currentLevel = _pageController.page!.toInt() - 1;
        setState(() {});
      },
    );
    if (lastTimeGiftString != null) {
      DateTime now = DateTime.now();
      DateTime nextGiftTime = DateTime.parse(lastTimeGiftString);
      different = nextGiftTime.difference(now).inSeconds;
      if (different! <= 0) {
        different == null;
      }
      context.read<BaseBloc>().state.when(
            load: (coins, openLevels) {
              _currentLevel = openLevels.length;
            },
            initial: () {},
          );
    }

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (different != null) {
            different = different! - 1;
          }
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            return state.when(
              load: (coins, openLevels) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10.r),
                        Center(
                          child: Image.asset(
                            Images.totLongLogoNqq,
                            height: 30.r,
                          ),
                        ),
                        SizedBox(height: 40.r),
                        Padding(
                          padding: EdgeInsets.only(left: 40.r),
                          child: TOTCoinsContainerYWB(
                            coins: coins,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ExpandablePageView(
                          // scrollBehavior: CustomScrollBehavior(),
                          padEnds: true,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          children: [
                            SizedBox(
                              width: 300.r,
                              height: 320.r,
                            ),
                            for (int i = 0; i < 6; i++)
                              GestureDetector(
                                onTap: () {
                                  if (openLevels.contains(i)) {
                                    Nav.pushPage(
                                        TOTGamePageIIQ(
                                          level: i,
                                        ),
                                        context);
                                  }
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.asset(
                                      "assets/images/lvl_$i.png",
                                      height: 320.r,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Level ${i + 1}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(height: 10.r),
                                        i == 0
                                            ? Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 100.r,
                                                ),
                                                child: Text(
                                                  "Free",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff00FF38),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              )
                                            : Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          openLevels.contains(i)
                                                              ? "Open"
                                                              : "Locked",
                                                          style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                        ),
                                                        SizedBox(width: 4.r),
                                                        Image.asset(
                                                          !openLevels
                                                                  .contains(i)
                                                              ? Images.lock
                                                              : Images.unlock,
                                                          width: 10.r,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 20.r),
                                                    if (!openLevels.contains(i))
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (coins >=
                                                              _coinPrize[i]) {
                                                            List<int>
                                                                newOpenLevels =
                                                                [];
                                                            newOpenLevels
                                                                .addAll(
                                                              openLevels,
                                                            );
                                                            newOpenLevels
                                                                .add(i);
                                                            sharedPreferences
                                                                .setStringList(
                                                              "openLevels",
                                                              TOTAppConvertNQE
                                                                  .totconvertToStringKQE(
                                                                newOpenLevels,
                                                              ),
                                                            );
                                                            TOTAppConvertNQE
                                                                .totchangeCoinsNQE(
                                                              -_coinPrize[i],
                                                              context,
                                                            );
                                                            context
                                                                .read<
                                                                    BaseBloc>()
                                                                .add(
                                                                  const BaseEvent
                                                                      .started(),
                                                                );
                                                          } else {
                                                            TOTAppMessagesHQQ
                                                                .totshowCustomMessageppq(
                                                              context,
                                                              "You don't have enough coins.",
                                                            );
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      const Color(
                                                                    0xff37FFFF,
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  40,
                                                                ),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xff00D1FF),
                                                                    Color(
                                                                        0xff023D94),
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  vertical: 6.r,
                                                                  horizontal:
                                                                      12.r,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Open for",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w800,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 10
                                                                            .r),
                                                                    TOTCoinsContainerYWB(
                                                                      coins:
                                                                          _coinPrize[
                                                                              i],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    SizedBox(height: 50.r),
                                                  ],
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 30.r),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 6; i++)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.r),
                                child: Container(
                                  height: 4.r,
                                  width: _currentLevel == i ? 30.r : 8.r,
                                  decoration: BoxDecoration(
                                    color: _currentLevel == i
                                        ? const Color(0xffFDC41C)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              different != null
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        Nav.pushPage(
                                          TOTDailyPageQJD(
                                            onGetReward: (int newCoints) {
                                              DateTime nextGiftTime =
                                                  DateTime.now().add(
                                                      const Duration(days: 1));
                                              sharedPreferences.setString(
                                                  "gift",
                                                  nextGiftTime.toString());
                                              different = nextGiftTime
                                                  .difference(DateTime.now())
                                                  .inSeconds;

                                              TOTAppConvertNQE
                                                  .totchangeCoinsNQE(
                                                      newCoints, context);
                                              setState(() {});
                                              context.read<BaseBloc>().add(
                                                  const BaseEvent.started());
                                            },
                                          ),
                                          context,
                                        );
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Image.asset(
                                            Images.totPrizeZss,
                                            height: 100.r,
                                          ),
                                          Positioned(
                                            right: 20.r,
                                            bottom: 18.r,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    Color(0xffF70000),
                                                    Color(0xffFF14BD),
                                                  ],
                                                ),
                                                border: Border.all(
                                                  color: TOTAppColorsPOA.pinc,
                                                ),
                                              ),
                                              child: CircleAvatar(
                                                radius: 12.r,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Text(
                                                  different == null
                                                      ? "1"
                                                      : TOTAppConvertNQE
                                                          .totconvertTimerFormatQEI(
                                                          Duration(
                                                              seconds:
                                                                  different!),
                                                        ),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              GestureDetector(
                                onTap: () => Nav.pushPage(
                                  const TOTSettingsPageTYQ(),
                                  context,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: TOTAppColorsPOA.background,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(11.r),
                                    child: Image.asset(
                                      Images.totSettingsSsf,
                                      height: 26.r,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.r),
                      ],
                    ),
                  ],
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
