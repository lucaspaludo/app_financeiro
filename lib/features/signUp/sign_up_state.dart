abstract class SignUpState {}

class SignUpStateInitial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSucess extends SignUpState {}

class SignUpStateError extends SignUpState {
  final String message;

  SignUpStateError(this.message);

}
