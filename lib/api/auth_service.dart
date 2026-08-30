import 'package:firebase_auth/firebase_auth.dart';

/*
A thin wrapper around Firebase Authentication.

It handles Sign up, Sign in, Sign out and exposes the current user + an
auth-state stream so the app can react to login/logout instantly.
*/

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// The currently signed-in user, or null if signed out.
  User? get currentUser => _auth.currentUser;

  /// The currently signed-in user's unique id (used as the Firestore userId),
  /// or null if signed out.
  String? get currentUserId => _auth.currentUser?.uid;

  /// Stream that emits the current user whenever auth state changes
  /// (login, logout, token refresh).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ---- Sign up (register a new account) ----
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ---- Sign in (log into an existing account) ----
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ---- Sign out ----
  Future<void> signOut() => _auth.signOut();
}
