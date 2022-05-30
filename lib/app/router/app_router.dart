import 'package:go_router/go_router.dart';
import 'package:sample_auth/app/blocs/authentication/auth_importer.dart';
import 'package:sample_auth/app/router/app_pages.dart';
import 'package:sample_auth/app/widgets/pages/home_page.dart';
import 'package:sample_auth/app/widgets/pages/sign_in_page.dart';
import 'package:sample_auth/app/widgets/pages/splash_page.dart';

class AppRouter {
  GoRouter get goRouter => _goRouter;
  final AuthBloc _authBloc;

  AppRouter(AuthBloc bloc) : _authBloc = bloc;

  late final GoRouter _goRouter = GoRouter(
      refreshListenable: GoRouterRefreshStream(_authBloc.stream),
      initialLocation: AppPages.home.toPath,
      routes: <GoRoute>[
        GoRoute(
          path: AppPages.home.toPath,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppPages.signin.toPath,
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: AppPages.splash.toPath,
          builder: (context, state) => const SplashPage(),
        ),
      ],
      redirect: (state) {
        // 認証ステータスを判定
        final authState = _authBloc.state;

        if (authState is UnInitialized &&
            state.location != AppPages.splash.toPath) {
          // 初期化されていない かつ スプラッシュ画面でない場合
          return AppPages.splash.toPath;
        }

        if (authState is NotAuth && state.location != AppPages.signin.toPath) {
          // 未認証 かつ 認証画面でない場合
          return AppPages.signin.toPath;
        }

        if (authState is Authenticated &&
            state.location != AppPages.home.toPath) {
          // 認証済 かつ ホーム画面でない場合
          return AppPages.home.toPath;
        }

        return null;
      });
}
