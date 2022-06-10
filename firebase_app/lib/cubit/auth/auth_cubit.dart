import 'package:firebase_app/cubit/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIntial());

  emailSignIn({required String email, required String password}) async {
    final auth = FirebaseAuth.instance;

    auth.currentUser;
    emit(AuthLoading(loadingMessage: "Signing you In...."));
    try {
      await auth.signOut();
      final cred = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(cred.toString());
      emit(AuthSuccess(user: cred.user));
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(AuthError(errorMessage: e.message ?? "Could not sign in"));
    } catch (e) {
      emit(AuthError(errorMessage: "Could not sign in"));
    }
  }

  signUp({required String email, required String password}) async {
    final auth = FirebaseAuth.instance;
    try {
      emit(AuthLoading(loadingMessage: "Creating Account...."));

      final credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess(user: credentials.user));

      print(credentials);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      emit(AuthError(errorMessage: e.message ?? "Could not sign in"));
    } catch (e) {
      print(e);
      emit(AuthError(errorMessage: "Could not sign in"));
    }
  }

  loginWithGoogle() {}
  loginWithFacebook() async {
    final LoginResult result =
        await FacebookAuth.instance.login(loginBehavior: LoginBehavior.webOnly);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      try {
        final userCred = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        emit(AuthSuccess(user: userCred.user));
      } on FirebaseAuthException catch (e) {
        emit(AuthError(errorMessage: e.message ?? "Login Errro"));
      }
    } else if (result.status == LoginStatus.cancelled) {
      emit(AuthError(errorMessage: "Login cancelled by user"));
    } else {
      print(result.status);
      emit(AuthError(errorMessage: result.message!));
    }
  }

  logout() {}
}
