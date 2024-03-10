import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/di/dependency_injection.dart';
import 'package:slash/core/routing/routes.dart';
import 'package:slash/features/home/data/models/product_response.dart';
import 'package:slash/features/home/logic/home_cubit.dart';
import 'package:slash/features/home/ui/screens/home_screen.dart';
import 'package:slash/features/home/ui/screens/product_details_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<HomeCubit>()..getProducts(),
              child: const HomeScreen()),
        );
      case Routes.productsDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final Product productModel = args["productModel"];
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getIt<HomeCubit>(),
            child: ProductDetailsScreen(
              productModel: productModel,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined to ${settings.name}'),
                  ),
                ));
    }
  }
}
