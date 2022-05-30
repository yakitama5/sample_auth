enum AppPages {
  signin,
  home,
  splash,
}

extension AppPageExtension on AppPages {
  String get toPath {
    switch (this) {
      case AppPages.signin:
        return "/signin";
      case AppPages.home:
        return "/";
      case AppPages.splash:
        return "/splash";
      default:
        return "/";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPages.signin:
        return "Sign In";
      case AppPages.home:
        return "Home";
      case AppPages.splash:
        return "Splash";
      default:
        return "Home";
    }
  }
}
