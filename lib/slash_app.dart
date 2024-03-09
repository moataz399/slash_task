import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/routing/app_router.dart';
import 'package:slash/core/routing/routes.dart';
import 'package:slash/core/theming/colors.dart';
class SlashApp extends StatelessWidget {
  final AppRouter appRouter;

  const SlashApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white, scrolledUnderElevation: 0.0),
              primaryColor: AppColors.mainGreen,
              scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.homeScreen),
    );
  }
}
