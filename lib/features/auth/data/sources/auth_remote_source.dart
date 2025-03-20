import 'package:charity_app/features/auth/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

class AuthRemoteSource {
  final Dio dio;

  AuthRemoteSource({required this.dio});

  Future<UserEntity> signInWithGoogle(String token) async {
    var request = await dio.post('auth/verify', data: {'token': token});

    return UserEntity.fromJson(request.data);
  }
}
