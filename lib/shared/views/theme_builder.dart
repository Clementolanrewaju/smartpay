import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/providers/app_theme/app_theme_provider.dart';
import 'package:smartpay/shared/utils/theme/app_colors.dart';
import 'package:smartpay/shared/utils/theme/app_theme.dart';


class ThemeBuilder extends ConsumerWidget {
  final Widget Function(
    BuildContext context,
    AppColor appColor,
    WidgetRef ref,
  ) builder;
  final bool useScaffold;
  const ThemeBuilder({
    required this.builder,
    this.useScaffold = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppTheme appTheme = ref.watch<AppTheme>(appThemeProvider);
    AppColor appColor = appTheme.appColor;
    Widget child = builder(context, appColor, ref);
    return useScaffold ? Scaffold(
      backgroundColor: appColor.backgroundColor,
      body: child,
    ) : child;
  }
}
