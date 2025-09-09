import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:tracker/features/onboarding/cubit/onboarding_state.dart';
import 'package:tracker/features/onboarding/repository/onboarding_repository.dart';

class OnboardingCubit extends Cubit<SignUpState> {
  OnboardingCubit(this.signupRepository) : super(SignUpInitial());
  final SignupRepository signupRepository;

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController loginPassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();

  // uploadLicense(XFile image) {
  //   license = image;
  //   emit(UploadLicense());
  // }

  @override
  Future<void> close() {
    signUpName.dispose();
    signUpEmail.dispose();
    signUpPhoneNumber.dispose();
    signUpPassword.dispose();
    confirmPassword.dispose();
    return super.close();
  }

  signUp() async {
    emit(SignUpLoading());
    final response = await signupRepository.signUp(
      signUpName.text,
      signUpPhoneNumber.text,
      signUpEmail.text,
      signUpPassword.text,
    );
    if (response == null) {
      emit(SignUpSuccess(message: 'SignUp Sucess'));
    } else {
      emit(SignUpFailure(errMessage: response));
    }
  }

  login() async {
    emit(SignUpLoading());
    final response = await signupRepository.login(
      loginEmail.text,
      loginPassword.text,
    );
    if (response == null) {
      emit(SignUpSuccess(message: 'SignUp Sucess'));
    } else {
      emit(SignUpFailure(errMessage: response));
    }
  }
}
