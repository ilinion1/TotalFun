import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:n1/tot_common_lnk/tot_services_nqe/tot_app_convert_oow.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'base_event.dart';
part 'base_state.dart';
part 'base_bloc.freezed.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final SharedPreferences sharedPreferences;

  BaseBloc({
    required this.sharedPreferences,
  }) : super(const _Initial()) {
    on<BaseEvent>((event, emit) {
      final int coins = sharedPreferences.getInt("coins") ?? 0;
      final List<int> openLevels = TOTAppConvertNQE.totconvertToIntNMQ(
        sharedPreferences.getStringList("openLevels") ?? ["0"],
      );
      emit(
        BaseState.load(
          coins: coins,
          openLevels: openLevels,
        ),
      );
    });
  }
}
