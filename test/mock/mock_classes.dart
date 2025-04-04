import 'package:app_financeiro/features/signUp/sign_up_controller.dart';
import 'package:app_financeiro/services/auth_service.dart';
import 'package:app_financeiro/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

class MockSecureStorage extends Mock implements SecureStorage {}

class MockSignUpController extends Mock implements SignUpController {}
