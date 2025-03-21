import 'package:charity_app/features/auth/presentation/pages/auth_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: AuthPage.path,
    routes: [
      GoRoute(
        path: AuthPage.path,
        builder: (context, state) => const AuthPage(),
      ),
    ],
  );
}
