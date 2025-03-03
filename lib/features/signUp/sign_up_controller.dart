import 'dart:developer';

import 'package:app_financeiro/features/signUp/sign_up_state.dart';
import 'package:app_financeiro/services/auth_service.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);
  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    _changeState(SignUpStateLoading());

    try {
     await _service.signUp(name: name, email: email, password: password);
      _changeState(SignUpStateSucess());

    } catch (e) {
      _changeState(SignUpStateError(e.toString()));
    }
  }
}
