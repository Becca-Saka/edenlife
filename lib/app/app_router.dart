import 'package:eden/ui/dashboard_view.dart';
import 'package:eden/ui/github_auth_screen.dart';
import 'package:eden/ui/sign_in_view.dart';
import 'package:eden/ui/start_up_view.dart';
import 'package:github_signin_aksoyhlc/github_signin_aksoyhlc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String startup = '/';
  static const String signIn = '/signIn';
  static const String dashboard = '/dashboard';
  static const String githubAuth = '/githubAuth';
}

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.startup,
    routes: [
      GoRoute(
        path: AppRoutes.startup,
        builder: (context, state) => const StartupView(),
      ),
      GoRoute(
        path: AppRoutes.githubAuth,
        builder: (context, state) => GithubAuthScreen(
          params: state.extra! as GithubParamsModel,
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardView(),
      ),
    ],
  );
}
