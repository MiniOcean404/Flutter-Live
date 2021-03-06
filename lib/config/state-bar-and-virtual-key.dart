import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './color.dart';
import 'dart:io';

void barColor({required String color}) {
  if (Platform.isAndroid) {}
  if (Platform.isIOS) {}

  // 白色沉浸式状态栏颜色  白色文字
  SystemUiOverlayStyle light = SystemUiOverlayStyle(
    // * 虚拟按键
    systemNavigationBarDividerColor: AppColor.primary, //分割颜色
    systemNavigationBarColor: AppColor.primary, //背景色
    systemNavigationBarIconBrightness: Brightness.dark, //图标色(按钮、小白条)
    systemNavigationBarContrastEnforced: false,

    // * 状态栏
    // 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
  );

  // 黑色沉浸式状态栏颜色 黑色文字
  SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    systemNavigationBarColor: AppColor.dark,
    systemNavigationBarDividerColor: AppColor.dark,
    systemNavigationBarIconBrightness: Brightness.light,

    /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  // 这个地方你可以去掉三目运算符 直接调用你想要的 效果即可
  "white" == color.trim()
      ? SystemChrome.setSystemUIOverlayStyle(light)
      : SystemChrome.setSystemUIOverlayStyle(dark);
}
