import 'package:go_router/go_router.dart';
import 'package:my_tasks/features/authentication/data/auth_repository.dart';
import 'package:my_tasks/features/authentication/presentation/screens/accounts_screen.dart';
import 'package:my_tasks/features/authentication/presentation/screens/register_screen.dart';
import 'package:my_tasks/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:my_tasks/features/task_management/presentation/screens/screens.dart';
import 'package:my_tasks/routes/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

enum AppRoutes { main, register, signIn }

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

      if (!isLoggedIn && state.matchedLocation == '/account') {
        return '/signIn';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
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

      // Bottom Navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/main',
                builder: (context, state) => AllTaskScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/incomplete',
                builder: (context, state) => InCompleteTasksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/add',
                builder: (context, state) => AddTaskScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/complete',
                builder: (context, state) => CompletedTasksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/account',
                builder: (context, state) => AccountsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
