class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class UploadLicense extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;
  SignUpSuccess({required this.message});
}

final class SignUpFailure extends SignUpState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}
