import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lyza_insta_clone/features/auth/models/auth_state.dart';
import 'package:lyza_insta_clone/features/auth/models/auth_result.dart';
import 'package:lyza_insta_clone/features/auth/backend/authenticator.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true) ;
  }
}
