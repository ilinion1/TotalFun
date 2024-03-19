import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/resources/resources.dart';

class TOTCoinsContainerYWB extends StatelessWidget {
  final int coins;
  const TOTCoinsContainerYWB({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Images.totCoinOos,
          height: 24.r,
        ),
        SizedBox(width: 5.r),
        Text(
          coins.toString(),
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
