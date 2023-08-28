import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final int advice_id;
  final String advice;
 const AdviceEntity({required this.advice_id, required this.advice});
  
  @override
  // TODO: implement props
  List<Object?> get props => [advice_id,advice];
}