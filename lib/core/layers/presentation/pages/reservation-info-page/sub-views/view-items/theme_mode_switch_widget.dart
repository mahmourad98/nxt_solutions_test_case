import 'package:flutter/material.dart';
import 'package:nxt_test_case/config/app_assets_path.dart';
import 'package:nxt_test_case/core/extras/constants/app_colors.dart';
import 'package:nxt_test_case/core/layers/presentation/shared-view-components/svg_image_widget.dart';

class ThemeModeSwitchWidget extends StatefulWidget {
  final bool isDarkMode;
  final void Function(bool) onThemeModeSwitched;
  const ThemeModeSwitchWidget({super.key, required this.isDarkMode, required this.onThemeModeSwitched,});
  @override State<ThemeModeSwitchWidget> createState() => _ThemeModeSwitchWidgetState();
}

class _ThemeModeSwitchWidgetState extends State<ThemeModeSwitchWidget> {
  late bool isDarkMode = widget.isDarkMode;
  Size get preferredSize => const Size(96.0, 36.0,);
  Size get iconSize => const Size(28.0, 28.0,);
  @override Widget build(BuildContext context,) {
    final start = isDarkMode ? preferredSize.width - (iconSize.width + 4.0) : 4.0;
    final double end = isDarkMode ? 4.0 : preferredSize.width - (iconSize.width + 4.0);
    return Semantics(
      button: true,
      child: InkWell(
        onTap: () {
          widget.onThemeModeSwitched(!isDarkMode,);
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints.tight(preferredSize,),
          duration: const Duration(milliseconds: 500,),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.greyColor5 : AppColors.whiteColor3,
            borderRadius: BorderRadius.circular(20.0,),
            border: Border.all(color: isDarkMode ? AppColors.greyColor4 : AppColors.blueColor2,),
          ),
          child: Stack(
            children: [
              AnimatedPositionedDirectional(
                duration: const Duration(milliseconds: 500,),
                curve: Curves.easeIn,
                top: 0.0, bottom: 0.0,
                start: start, end: end,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500,),
                  transitionBuilder: (Widget child, Animation<double> animation,) {
                    return RotationTransition(
                      turns: animation,
                      child: child,
                    );
                  },
                  child: Builder(
                    builder: (BuildContext context,) {
                      if(isDarkMode) {
                        return SvgImageWidget(
                          key: const ValueKey("light-theme-mode-icon-key",),
                          imagePath: AppAssetsPath.LIGHT_THEME_MODE_ICON,
                          imageFit: BoxFit.contain,
                          color: AppColors.yellow3,
                          preferredWidth: iconSize.width, preferredHeight: iconSize.height,
                        );
                      } else {
                        return SvgImageWidget(
                          key: const ValueKey("dark-theme-mode-icon-key",),
                          imagePath: AppAssetsPath.DART_THEME_MODE_ICON,
                          imageFit: BoxFit.contain,
                          color: AppColors.blueColor3,
                          preferredWidth: iconSize.width, preferredHeight: iconSize.height,
                        );
                      }
                    },
                  )
                ),
              ),
              AnimatedPositionedDirectional(
                duration: const Duration(milliseconds: 500,),
                curve: Curves.easeIn,
                top: 0.0, bottom: 0.0,
                start: end, end: start,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500,),
                  transitionBuilder: (Widget child, Animation<double> animation,) {
                    return RotationTransition(
                      turns: animation,
                      child: child,
                    );
                  },
                  child: CircleAvatar(
                    key: const ValueKey("theme-mode-switch-circle-avatar-key",),
                    radius: 12.0,
                    backgroundColor: isDarkMode ? AppColors.greyColor4 : AppColors.blueColor2,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
