import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_app_convert_oow.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_nav_jwq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_app_page_nlq.dart';
import 'package:n1/tot_common_lnk/tot_widgets_zsd/tot_base_button_jkq.dart';
import 'package:n1/tot_pages_nqw/tot_home_iio/tot_home_page_zza.dart';
import 'package:n1/resources/resources.dart';

class TOTFirstBonnusPageRWJ extends StatelessWidget {
  const TOTFirstBonnusPageRWJ({super.key});

  @override
  Widget build(BuildContext context) {
    return TOTAppPageNEQ(
      backgroundImage: Images.totFirstSsq,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.r),
            child: TOTPinkTOTBaseButtonNKQ(
              text: "Recieve",
              onTap: () {
                TOTAppConvertNQE.totchangeCoinsNQE(50, context);
                Nav.pushReplacementPage(const TOTHomePageOOQ(), context);
              },
            ),
          ),
          SizedBox(height: 100.r),
        ],
      ),
    );
  }
}
