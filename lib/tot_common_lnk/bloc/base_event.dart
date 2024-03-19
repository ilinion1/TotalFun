part of 'base_bloc.dart';

@freezed
class BaseEvent with _$BaseEvent {
  const factory BaseEvent.started() = _Started;
}