import 'package:charity_app/features/auth/domain/entities/user_entity.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState {
  final UserStatus status;
  final String? message;
  final UserEntity? user;

  UserState._({required this.status, this.message, this.user});

  factory UserState.initial() => UserState._(status: UserStatus.initial);

  UserState copyWith({UserStatus? status, String? message, UserEntity? user}) {
    return UserState._(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
