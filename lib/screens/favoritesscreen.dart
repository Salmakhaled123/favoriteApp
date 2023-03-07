import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favoritesapp/cubit/favoritecubit.dart';
import 'package:favoritesapp/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit,FavoriteStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit=FavoriteCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const  Text('favorites'),
          ),
          body: ConditionalBuilder(condition:cubit.favorites.isNotEmpty, builder: (context)
          {
            return ListView.separated(itemBuilder: (context,index){
              return ListTile(
                leading: Image(image: AssetImage(cubit.favorites[index].image)),
                title: Text(
                  cubit.favorites[index].name,
                ),
                subtitle: Text(cubit.favorites[index].subTitle),
                trailing:
                InkWell(
                    child:
                  const Icon(Icons.delete,color: Colors.red,size: 30)
                    ,
                    onTap: ()
                    {
                      cubit.favorites[index].fav=false;
                      cubit.removeFavProduct(cubit.favorites[index]);
                    }),
              );
            }, separatorBuilder: (context,index){
              return const Divider();
            }, itemCount: cubit.favorites.length);
          }, 
              fallback: (context)=>Center(child: Image.network(
                  'https://img.freepik.com/premium-vector/wishlist_203633-574.jpg?w=740'),)),
        );
      },
    );
  }
}
