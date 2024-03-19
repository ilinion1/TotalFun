import 'package:flame_audio/bgm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_app_bar_rrt.dart';
import 'package:n1/tot_pages_nqw/tot_settings_uuq/tot_rules_page_uiq.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TOTSettingsPageTYQ extends StatefulWidget {
  const TOTSettingsPageTYQ({super.key});

  @override
  State<TOTSettingsPageTYQ> createState() => _TOTSettingsPageTYQState();
}

class _TOTSettingsPageTYQState extends State<TOTSettingsPageTYQ> {
  late SharedPreferences sharedPreferences;
  late bool backgroundSoundActive;
  late Bgm flameAudio;
  @override
  void initState() {
    sharedPreferences = context.read<SharedPreferences>();
    backgroundSoundActive =
        sharedPreferences.getBool("backgroundSound") ?? false;
    flameAudio = context.read<Bgm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              const TOTBaseAppBarPPO(
                title: "Settings",
              ),
              SizedBox(height: 20.r),
              settinsRow(
                "Sound",
                () async {
                  if (backgroundSoundActive) {
                    await sharedPreferences.setBool(
                      "backgroundSound",
                      false,
                    );
                    await flameAudio.pause();
                  } else {
                    await sharedPreferences.setBool(
                      "backgroundSound",
                      true,
                    );
                    await flameAudio.resume();
                  }

                  backgroundSoundActive = !backgroundSoundActive;
                  setState(() {});
                },
                backgroundSoundActive,
              ),
              SizedBox(height: 10.r),
              settinsRow(
                "Rules",
                () => Nav.pushPage(const TOTRulesPageJKQ(), context),
                null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget settinsRow(String title, VoidCallback onTap, bool? isActive) {
  return GestureDetector(
    onTap: onTap,
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TOTAppColorsPOA.background,
      ),
      child: SizedBox(
        height: 60.r,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.r,
            vertical: 10.r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
              if (isActive != null)
                Switch(
                  value: isActive,
                  onChanged: (_) {
                    onTap();
                  },
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
