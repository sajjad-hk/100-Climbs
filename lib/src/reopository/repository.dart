import 'package:hundred_climbs/src/reopository/StorageRepository.dart';

class Repository with StorageRepository {
  final _authProvider = AuthProvider();

  Future<void> sendSignInWithEmailLink(String email) =>
      _authProvider.sendSignInWithEmailLink(email);

  Future<AuthResult> signInWithEmailLink(String email, String link) =>
      _authProvider.signInWithEmailLink(email, link);

  Future<AuthResult> signInWithCredential(AuthCredential credential) =>
      _authProvider.signInWithCredential(credential);

  Future<FirebaseUser> getCurrentUser() => _authProvider.getCurrentUser();

  Future<void> verifyPhoneNumber(
          String phone,
          PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
          PhoneCodeSent codeSent,
          Duration duration,
          PhoneVerificationCompleted verificationCompleted,
          PhoneVerificationFailed verificationFailed) =>
      _authProvider.verifyPhoneNumber(phone, codeAutoRetrievalTimeout, codeSent,
          duration, verificationCompleted, verificationFailed);
}
