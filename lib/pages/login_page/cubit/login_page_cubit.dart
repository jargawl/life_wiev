import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit()
      : super(
          const LoginPageState(
            user: null,
            isLoaading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> singOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(
      const LoginPageState(
        user: null,
        isLoaading: true,
        errorMessage: '',
      ),
    );
    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          LoginPageState(
            user: user,
            isLoaading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            LoginPageState(
              user: null,
              isLoaading: false,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
