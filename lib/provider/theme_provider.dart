import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_provider/common/constants.dart';
import 'package:flutter_provider/common/color.dart';
import 'package:flutter_provider/common/cache.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;

  // 获取当前mode
  var _platformBrightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  // 系统Dark Mode发生变化
  void darkModeChange() {
    debugPrint(_platformBrightness.toString());
    if (_platformBrightness !=
        SchedulerBinding.instance.platformDispatcher.platformBrightness) {
      _platformBrightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      notifyListeners();
    }
  }

  //判断是否是Dark Mode
  bool isDark() {
    if (_themeMode == ThemeMode.system) {
      //获取系统的Dark Mode
      return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  //获取主题模式
  ThemeMode getThemeMode() {
    String? theme = BzCache.getInstance().get(Constants.theme);
    switch (theme) {
      case 'Dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'System':
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
        break;
    }
    return _themeMode!;
  }

  //设置主题
  void setTheme(ThemeMode themeMode) {
    BzCache.getInstance().setString(Constants.theme, themeMode.value);
    notifyListeners();
  }

  //获取主题
  ThemeData getTheme({bool isDarkMode = false}) {
    var themeData = ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? IColor.darkBg : whiteColor,
      //Tab指示器的颜色
      indicatorColor: isDarkMode ? primaryColor : whiteColor,
      //页面背景色
      scaffoldBackgroundColor: isDarkMode ? IColor.darkBg : whiteColor,
      // 分割线颜色
      dividerColor: isDarkMode ? Colors.black38 : Colors.black12,
    );
    return themeData;
  }
}
