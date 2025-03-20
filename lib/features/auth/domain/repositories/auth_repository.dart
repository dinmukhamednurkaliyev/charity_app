import 'package:charity_app/core/model/either.dart';
import 'package:charity_app/core/model/failure.dart';
import 'package:charity_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
