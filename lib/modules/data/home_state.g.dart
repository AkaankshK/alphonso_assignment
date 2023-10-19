// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$HomeStateToJson(HomeState instance) => <String, dynamic>{
      'isLoading': instance.isLoading,
      'outputCsv': instance.outputCsv,
    };

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      isLoading: json['isLoading'] ?? false,
      outputCsv: json['outputCsv'] as String? ?? '',
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'outputCsv': instance.outputCsv,
    };
