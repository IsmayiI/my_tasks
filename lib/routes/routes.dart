import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/features/authentication/presentation/screens/register_screen.dart';
import 'package:my_tasks/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:my_tasks/features/task_management/presentation/screens/main_screen.dart';
import 'package:my_tasks/routes/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

enum AppRoutes { main, register, signIn }

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return GoRouter(
    initialLocation: '/signIn',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;

      if (isLoggedIn &&
          (state.matchedLocation == '/signIn' ||
              state.matchedLocation == '/register')) {
        return '/main';
      }

      if (!isLoggedIn && state.matchedLocation == '/main') {
        return '/signIn';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        path: '/main',
        name: AppRoutes.main.name,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRoutes.register.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoutes.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),
    ],
  );
}
