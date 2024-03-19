import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n1/tot_common_lnk/tot_styles_tte/tot_app_colors_ssq.dart';

class TOTBaseButtonAQA extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  const TOTBaseButtonAQA({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.r),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TOTPinkTOTBaseButtonNKQ extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const TOTPinkTOTBaseButtonNKQ({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TOTBaseButtonAQA(
      text: text,
      onTap: onTap,
      color: TOTAppColorsPOA.pinc,
    );
  }
}

class TOTDarkTOTBaseButtonAQANQQ extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const TOTDarkTOTBaseButtonAQANQQ({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TOTBaseButtonAQA(
      text: text,
      onTap: onTap,
      color: TOTAppColorsPOA.background,
    );
  }
}
