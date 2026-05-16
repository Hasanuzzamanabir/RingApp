import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:orange/core/bindings/controller_binder.dart';
import 'package:orange/routes/app_routes.dart';

class orange extends StatefulWidget {
  const orange({super.key});

  @override
  State<orange> createState() => _orangeState();
}

class _orangeState extends State<orange> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   unawaited(AlarmNotificationService.instance.initialize());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'orange',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.splashScreen,
          getPages: AppRoute.routes,
          initialBinding: ControllerBinder(),
          themeMode: ThemeMode.system,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
