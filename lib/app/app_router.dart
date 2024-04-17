import 'package:eden/ui/dashboard_view.dart';
import 'package:eden/ui/start_up_view.dart';
import 'package:github_signin_aksoyhlc/github_signin_aksoyhlc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String startup = '/';
  static const String signIn = '/signIn';
  static const String dashboard = '/home';
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
        path: AppRoutes.startup,
        builder: (context, state) => GithubSignIn(
          params: state.extra! as GithubParamsModel,
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => const DashboardView(),
      ),
    ],
  );
}
