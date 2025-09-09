import 'package:tracker/core/services/api/end_points.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> JsonData) {
    return SignUpModel(message: JsonData[ApiKeys.message]);
  }
}
