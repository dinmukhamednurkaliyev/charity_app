import 'package:charity_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:charity_app/features/auth/presentation/bloc/user_event.dart';
import 'package:charity_app/features/auth/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository authRepository;
  UserBloc({required this.authRepository}) : super(UserState.initial()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogleEvent);
  }

  void _onSignInWithGoogleEvent(
    SignInWithGoogleEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    var result = await authRepository.signInWithGoogle();
    result.fold(
      (left) {
        emit(
          state.copyWith(status: UserStatus.error, message: left.message),
        ); // Emit the new state with the error message
      },
      (right) {
        emit(
          state.copyWith(status: UserStatus.loaded, user: right),
        ); // Emit the new state with the loaded user
      },
    );
  }
}
