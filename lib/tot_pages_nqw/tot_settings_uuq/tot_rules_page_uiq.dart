import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_app_bar_rrt.dart';

class TOTRulesPageJKQ extends StatelessWidget {
  const TOTRulesPageJKQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TOTBaseAppBarPPO(
                title: "Rules",
              ),
              SizedBox(height: 20.r),
              Text(
                "Match three items in a row in the bottom block. You will have a certain amount of time during which you need to collect all the items from the field.",
                style: baseStyle(),
              ),
              SizedBox(
                height: 20.r,
              ),
              Text(
                "You will multiply your winnings by collecting items at a certain speed.",
                style: baseStyle(),
              ),
              SizedBox(
                height: 20.r,
              ),
              Text(
                "If time runs out and you do not have time to collect all the items from the field, you will lose and the game will end.",
                style: baseStyle(),
              ),
              SizedBox(
                height: 20.r,
              ),
              Text(
                "Hurry up to test your abilities!",
                style: baseStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle baseStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
  );
}
