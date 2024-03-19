import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:n1/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.item00).existsSync(), isTrue);
    expect(File(Images.item01).existsSync(), isTrue);
    expect(File(Images.item02).existsSync(), isTrue);
    expect(File(Images.item03).existsSync(), isTrue);
    expect(File(Images.item10).existsSync(), isTrue);
    expect(File(Images.item11).existsSync(), isTrue);
    expect(File(Images.item12).existsSync(), isTrue);
    expect(File(Images.item13).existsSync(), isTrue);
    expect(File(Images.item20).existsSync(), isTrue);
    expect(File(Images.item21).existsSync(), isTrue);
    expect(File(Images.item22).existsSync(), isTrue);
    expect(File(Images.item23).existsSync(), isTrue);
    expect(File(Images.item30).existsSync(), isTrue);
    expect(File(Images.item31).existsSync(), isTrue);
    expect(File(Images.item32).existsSync(), isTrue);
    expect(File(Images.item33).existsSync(), isTrue);
    expect(File(Images.item40).existsSync(), isTrue);
    expect(File(Images.item41).existsSync(), isTrue);
    expect(File(Images.item42).existsSync(), isTrue);
    expect(File(Images.item43).existsSync(), isTrue);
    expect(File(Images.item50).existsSync(), isTrue);
    expect(File(Images.item51).existsSync(), isTrue);
    expect(File(Images.item52).existsSync(), isTrue);
    expect(File(Images.item53).existsSync(), isTrue);
    expect(File(Images.lock).existsSync(), isTrue);
    expect(File(Images.lvl0).existsSync(), isTrue);
    expect(File(Images.lvl1).existsSync(), isTrue);
    expect(File(Images.lvl2).existsSync(), isTrue);
    expect(File(Images.lvl3).existsSync(), isTrue);
    expect(File(Images.lvl4).existsSync(), isTrue);
    expect(File(Images.lvl5).existsSync(), isTrue);
    expect(File(Images.totBigPrizeWwr).existsSync(), isTrue);
    expect(File(Images.totCoinOos).existsSync(), isTrue);
    expect(File(Images.totFirstSsq).existsSync(), isTrue);
    expect(File(Images.totLogoKaw).existsSync(), isTrue);
    expect(File(Images.totLongLogoNqq).existsSync(), isTrue);
    expect(File(Images.totLoseEff).existsSync(), isTrue);
    expect(File(Images.totOnbAdv).existsSync(), isTrue);
    expect(File(Images.totOnbNqj).existsSync(), isTrue);
    expect(File(Images.totOnbPqx).existsSync(), isTrue);
    expect(File(Images.totPrizeZss).existsSync(), isTrue);
    expect(File(Images.totSettingsSsf).existsSync(), isTrue);
    expect(File(Images.totTimeEei).existsSync(), isTrue);
    expect(File(Images.totWinOoi).existsSync(), isTrue);
    expect(File(Images.unlock).existsSync(), isTrue);
  });
}
