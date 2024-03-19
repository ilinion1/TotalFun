import 'package:flutter/material.dart';

class TOTAppPageNEQ extends StatelessWidget {
  final Widget content;
  final String? backgroundImage;
  final BoxFit boxFit;
  final bool filter;
  final bool withSafeArea;

  const TOTAppPageNEQ({
    super.key,
    required this.content,
    this.backgroundImage,
    this.boxFit = BoxFit.fill,
    this.filter = false,
    this.withSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (backgroundImage != null)
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                filter
                    ? const Color(0xffD67D2B).withOpacity(0.9)
                    : Colors.transparent,
                BlendMode.lighten,
              ),
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      backgroundImage!,
                    ),
                    fit: boxFit,
                  ),
                ),
              ),
            ),
          withSafeArea ? SafeArea(child: content) : content,
        ],
      ),
    );
  }
}
