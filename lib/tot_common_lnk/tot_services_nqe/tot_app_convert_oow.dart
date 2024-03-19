import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TOTAppConvertNQE {
  static void totchangeCoinsNQE(int newValue, BuildContext context) {
    final SharedPreferences sharedPreferences =
        context.read<SharedPreferences>();
    int coins = sharedPreferences.getInt("coins") ?? 0;
    int newCoins = 0;
    newCoins = coins;
    newCoins = newCoins + newValue;

    sharedPreferences.setInt("coins", newCoins);
  }

  static List<int> totconvertToIntNMQ(List<String> values) {
    List<int> result = [];
    for (var element in values) {
      result.add(int.parse(element));
    }
    return result;
  }

  static List<String> totconvertToStringKQE(List<int> values) {
    List<String> result = [];
    for (var element in values) {
      result.add(element.toString());
    }
    return result;
  }

  static String tottotconvertTimerFormatQEIMinutesPPQ(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static String totconvertTimerFormatQEI(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
