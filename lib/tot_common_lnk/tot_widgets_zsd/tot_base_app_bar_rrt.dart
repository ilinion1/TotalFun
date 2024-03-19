import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';
import 'package:n1/tot_pages_nqw/tot_settings_uuq/tot_settings_page_ioq.dart';

class TOTBaseAppBarPPO extends StatelessWidget {
  final String title;
  final bool showSettings;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onSettingsEnd;

  const TOTBaseAppBarPPO({
    super.key,
    required this.title,
    this.showSettings = false,
    this.onSettingsTap,
    this.onSettingsEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: TOTAppColorsPOA.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: 48.r,
                width: 60.r,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18.sp,
            ),
          ),
          showSettings
              ? GestureDetector(
                  onTap: () async {
                    onSettingsTap!();
                    await Nav.pushPage(
                      const TOTSettingsPageTYQ(),
                      context,
                    );
                    onSettingsEnd!();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: TOTAppColorsPOA.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: 48.r,
                      width: 60.r,
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : SizedBox(width: 60.r),
        ],
      ),
    );
  }
}
