import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/shared/utils/theme/app_theme.dart';


var appThemeProvider = StateNotifierProvider.autoDispose<_AppThemeStateNotifier, AppTheme>(
  (ref) => _AppThemeStateNotifier(),
);

class _AppThemeStateNotifier extends StateNotifier<AppTheme> {
  _AppThemeStateNotifier() : super(AppTheme.light());

  void setLightMode() {
    state = AppTheme.light();
  }

  void setDarkMode() {
    state = AppTheme.dark();
  }
}
