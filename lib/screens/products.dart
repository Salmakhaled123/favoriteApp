import 'package:favoritesapp/cubit/favoritecubit.dart';
import 'package:favoritesapp/cubit/states.dart';
import 'package:favoritesapp/screens/favoritesscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('products'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritesScreen()));
                    },
                    icon: Icon(Icons.favorite_border))
              ],
            ),
            body: ListView.separated(
                itemBuilder: (context, index)
                {
                  return ListTile(
                    leading: Image(image: AssetImage(cubit.products[index].image)),
                    title: Text(
                      cubit.products[index].name,
                    ),
                    subtitle: Text(cubit.products[index].subTitle),
                    trailing:
                    InkWell(
                        child:
                       cubit.products[index].fav?
                           Icon(Icons.favorite,size: 30,color:Colors.red,):
                       Icon(Icons.favorite_border_sharp,size: 30,)
                        ,
                        onTap: ()
                        {
                          cubit.isFavorites(cubit.products[index]);
                        }),
                  );
                },

                separatorBuilder: (context, index) => Divider(),
                itemCount: cubit.products.length));
      },
      listener: (context, state) {

      },
    );
  }
}

// Widget buildItem(UserModel model, context,index)
// {
//
//   return ListTile(
//     leading: Image(image: AssetImage(model.image)),
//     title: Text(
//       model.name,
//     ),
//     subtitle: Text(model.subTitle),
//     trailing:
//     InkWell(
//         child:
//       FavoriteCubit.get(context).isFavorite==true?
//        Icon(Icons.favorite,color: Colors.red,size: 30,):
//       Icon(Icons.favorite_border_sharp,size: 30,)
//         ,
//         onTap: ()
//         {
//          FavoriteCubit.get(context).isFavorites(cubit.products[index].id);
//         }),
//   );
// }
