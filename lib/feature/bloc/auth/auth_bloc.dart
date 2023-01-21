import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business/auth/business_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      // Initialize Bloc with init State
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      // Using the 'on' keyword, ..add(AuthenticationStarted) in the main
      // will trigger this event
      if (event is AuthenticationStarted) {
        UserDto user = await _authenticationRepository.getCurrentUser().first;
        if (user.uid != "uid") {
          emit(const AuthenticationSuccess());
        } else {
          await _authenticationRepository.signIn();
          user = await _authenticationRepository.getCurrentUser().first;
          if (user.uid != "uid") {
            emit(const AuthenticationSuccess());
          } else {
            emit(AuthenticationFailure());
          }
        }
      } else if (event is AuthenticationSignedOut) {
        await _authenticationRepository.signOut();
        emit(AuthenticationFailure());
      }
    });
  }
}
