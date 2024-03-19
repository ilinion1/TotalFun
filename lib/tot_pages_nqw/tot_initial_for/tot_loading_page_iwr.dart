import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_pages_nqw/tot_home_iio/tot_home_page_zza.dart';
import 'package:n1/tot_pages_nqw/tot_initial_for/tot_onboarding_page_aaq.dart';
import 'package:n1/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TOTLoadingPagePOZ extends StatefulWidget {
  const TOTLoadingPagePOZ({super.key});

  @override
  State<TOTLoadingPagePOZ> createState() => _TOTLoadingPagePOZState();
}

class _TOTLoadingPagePOZState extends State<TOTLoadingPagePOZ> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    bool onbording = sharedPreferences.getBool("onbording") ?? true;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (onbording) {
          Nav.pushReplacementPage(const TOTOnboardingPageLLA(), context);
          sharedPreferences.setBool("onbording", false);
        } else {
          Nav.pushReplacementPage(const TOTHomePageOOQ(), context);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.totLogoKaw,
            height: 120.r,
          ),
          SizedBox(height: 70.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.r),
            child: LinearProgressIndicator(
              minHeight: 4.r,
              backgroundColor: const Color(0xff2C2C5A),
              color: const Color(0xffFDC31D),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
