import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/bloc/base_bloc.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_app_page_nlq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_button_jkq.dart';
import 'package:n1/tot_pages_nqw/tot_game_klq/tot_game_page_koq.dart';
import 'package:n1/resources/resources.dart';

class TOTLosePageMQD extends StatelessWidget {
  final int level;
  const TOTLosePageMQD({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: TOTAppPageNEQ(
        backgroundImage: Images.totLoseEff,
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
                                "Failed...!",
                                style: TextStyle(
                                  color: const Color(0xffF70000),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 80.r),
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
                            text: "Try Again",
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Nav.pushPage(
                                  TOTGamePageIIQ(level: level), context);
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
