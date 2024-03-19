import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_app_convert_oow.dart';
import 'package:n1/resources/resources.dart';

class TOTTimeContainerOJE extends StatelessWidget {
  final int time;
  const TOTTimeContainerOJE({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Images.totTimeEei,
          height: 24.r,
        ),
        SizedBox(width: 5.r),
        Text(
          TOTAppConvertNQE.tottotconvertTimerFormatQEIMinutesPPQ(
              Duration(seconds: time)),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
