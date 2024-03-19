import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_app_page_nlq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_button_jkq.dart';
import 'package:n1/tot_pages_nqw/tot_first_bonnus_page_bqr.dart';
import 'package:n1/resources/resources.dart';

class TOTOnboardingPageLLA extends StatefulWidget {
  const TOTOnboardingPageLLA({super.key});

  @override
  State<TOTOnboardingPageLLA> createState() => _TOTOnboardingPageLLAState();
}

class _TOTOnboardingPageLLAState extends State<TOTOnboardingPageLLA> {
  int _index = 0;
  final List<String> _images = [
    Images.totOnbNqj,
    Images.totOnbPqx,
    Images.totOnbAdv,
  ];
  @override
  Widget build(BuildContext context) {
    return TOTAppPageNEQ(
      backgroundImage: _images[_index],
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TOTPinkTOTBaseButtonNKQ(
              text: "Next",
              onTap: () {
                if (_index < 2) {
                  setState(() {
                    _index++;
                  });
                } else {
                  Nav.pushReplacementPage(
                      const TOTFirstBonnusPageRWJ(), context);
                }
              },
            ),
            SizedBox(height: 10.r),
            TOTDarkTOTBaseButtonAQANQQ(
              text: "Skip",
              onTap: () {
                Nav.pushReplacementPage(const TOTFirstBonnusPageRWJ(), context);
              },
            ),
            SizedBox(height: 20.r),
          ],
        ),
      ),
    );
  }
}
