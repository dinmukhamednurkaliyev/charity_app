import 'package:charity_app/core/model/either.dart';
import 'package:charity_app/core/model/failure.dart';
import 'package:charity_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:charity_app/features/auth/domain/entities/user_entity.dart';
import 'package:charity_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  final GoogleSignIn googleSignIn;
  AuthRepositoryImpl({
    required this.authRemoteSource,
    required this.googleSignIn,
  });
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final firebaseCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final token = await firebaseCredential.user?.getIdToken();

      if (token != null) {
        return Right(await authRemoteSource.signInWithGoogle(token));
      } else {
        return Left(AuthFailure(message: 'Failed to get token'));
      }
    } on DioException catch (error) {
      return Left(
        AuthFailure(
          message: error.response?.data['message'] ?? 'Unknown error',
        ),
      );
    }
  }
}
