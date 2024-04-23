import 'package:flutter/material.dart';
import 'package:nxt_test_case/config/app_assets_path.dart';
import 'package:nxt_test_case/core/extras/services/app_theme_service.dart';
import 'package:nxt_test_case/core/layers/presentation/pages/reservation-info-page/sub-views/view-items/theme_mode_switch_widget.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/svg_image_widget.dart';
import 'package:nxt_test_case/out-buildings/dependency_injector.dart';

class ThemeChangeRowSubView extends StatelessWidget {
  final bool isDarkMode;
  const ThemeChangeRowSubView(this.isDarkMode,) : super(key: null,);
  @override Widget build(BuildContext context,) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 32.0,),
        SvgImageWidget(
          imagePath: AppAssetsPath.THEME_MODE_ICON,
          preferredWidth: 32.0, preferredHeight: 32.0,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        const SizedBox(width: 8.0,),
        Text(
          "Theme",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        ThemeModeSwitchWidget(
          isDarkMode: isDarkMode,
          onThemeModeSwitched: (bool isDarkMode,) {
            return serviceLocator<AppThemeService>().setCurrentTheme(
              isDarkMode ? ThemeMode.dark : ThemeMode.light,
            );
          },
        ),
        const SizedBox(width: 32.0,),
      ],
    );
  }
}