import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.g.dart';
part 'home_state.freezed.dart';

@JsonSerializable(createFactory: false)
@freezed
class HomeState with _$HomeState {
factory HomeState({
    @Default(false) isLoading,
    @Default('') String outputCsv,
 }) = _HomeState;

factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
@override
 Map<String, dynamic> toJson() => _$HomeStateToJson(this);
}