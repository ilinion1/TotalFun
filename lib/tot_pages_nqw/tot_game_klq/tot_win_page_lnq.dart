import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_app_page_nlq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_button_jkq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_coins_container_iiq.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_game_page_koq.dart';
import 'package:n1/resources/resources.dart';

class TOTWinPageNCA extends StatelessWidget {
  final int level;
  final int newCoins;
  const TOTWinPageNCA({
    super.key,
    required this.level,
    required this.newCoins,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: TOTAppPageNEQ(
        backgroundImage: Images.totWinOoi,
        content: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            return state.when(
              load: (coins, openLevels) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            "assets/images/lvl_$level.png",
                            height: 300.r,
                          ),
                          Column(
                            children: [
                              Text(
                                "Level ${level + 1}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 10.r),
                              Text(
                                "Complete!",
                                style: TextStyle(
                                  color: const Color(0xff00FF38),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 22.r),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TOTCoinsContainerYWB(coins: newCoins),
                                ],
                              ),
                              SizedBox(height: 50.r),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.r),
                      child: Column(
                        children: [
                          TOTPinkTOTBaseButtonNKQ(
                            text: "Next Level",
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              int nextLevel = level + 1;
                              if (nextLevel == 5) {
                                return;
                              } else {
                                if (openLevels.contains(nextLevel)) {
                                  Nav.pushPage(TOTGamePageIIQ(level: nextLevel),
                                      context);
                                }
                              }
                            },
                          ),
                          SizedBox(height: 8.r),
                          TOTDarkTOTBaseButtonAQANQQ(
                            text: "Home",
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(height: 70.r),
                        ],
                      ),
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
