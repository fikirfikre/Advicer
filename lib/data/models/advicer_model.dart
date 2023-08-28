import 'package:advicer/domain/entity/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdvicerModel extends AdviceEntity with EquatableMixin{
  AdvicerModel({required super.advice_id, required super.advice});

 factory AdvicerModel.fromJson(Map<String,dynamic> json){
  return AdvicerModel(advice_id: json['advice_id'], advice: json['advice']);
 }
  Map<String,dynamic> toJson(AdvicerModel advice){
   
  return  {
    'id' :advice.advice_id,
    'advice':advice.advice
  };
  
 }

}