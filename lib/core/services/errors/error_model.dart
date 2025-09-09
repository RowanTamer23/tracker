import '../api/end_points.dart';

class ErrorModel {
  final String status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.formJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status].toString(),
      errorMessage: jsonData[ApiKeys.message].toString(),
    );
  }
}
