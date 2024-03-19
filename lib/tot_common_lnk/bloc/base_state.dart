part of 'base_bloc.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState.initial() = _Initial;
  const factory BaseState.load({
    required int coins,
    required List<int> openLevels,
  }) = _Load;
}
