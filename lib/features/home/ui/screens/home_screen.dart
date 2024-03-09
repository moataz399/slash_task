import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/home/logic/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsSuccessState) {
            return Column(
              children: [
                Center(
                  child: Text(
                    context.read<HomeCubit>().productsList.length.toString(),
                  ),
                ),  Center(
                  child: Text(
                    state.list.length.toString(),
                  ),
                ),
              ],
            );
          } else {
            return InkWell(
                onTap: () {
                  context.read<HomeCubit>().getProducts();
                },
                child: Center(child: Text("no data available")));
          }
        },
      ),
    );
  }
}
// SafeArea(
// child: Column(
// children: [
// Center(
// child: InkWell(
// onTap: () {
// context.read<HomeCubit>().getProducts();
// },
// child: Text("Home Screen"),
// ),
// ),
//
// ],
// ),
// ),
