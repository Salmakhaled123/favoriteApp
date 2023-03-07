import 'package:favoritesapp/cubit/favoritecubit.dart';
import 'package:favoritesapp/cubit/states.dart';
import 'package:favoritesapp/screens/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';

void main()
{
  Bloc.observer = MyBlocObserver();
  runApp(const HomeScreen());

}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create :(context)=>FavoriteCubit(),
      child: BlocConsumer<FavoriteCubit,FavoriteStates>(
        builder:(context,state)=>MaterialApp(
          title: 'watch store',
          debugShowCheckedModeBanner: false,
          home: ProductsScreen(),
        ),
        listener: (context,state){},
      ),
    );
  }
}
