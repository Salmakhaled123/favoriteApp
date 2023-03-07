
import 'package:bloc/bloc.dart';
import 'package:favoritesapp/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoritesInitialState());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  bool isSaved=false;
  List<UserModel>products = [
    UserModel(fav: false,
        name: 'watch 1', image: 'assets/watch1.jpg', subTitle: 'available',
    ),
    UserModel(
        name: 'watch2', image: 'assets/watch1.jpg', subTitle: 'available',fav: false),
    UserModel(
        name: 'watch3', image: 'assets/watch1.jpg', subTitle: 'not available',
      fav: false,
    ),
  ];

  List<UserModel>favorites=[];

  bool isFavorites(UserModel model)
  {
 model.fav=!model.fav;

  if(model.fav==true )
   {
     favorites.add(model);
   }
  else if(model.fav==false && favorites.contains(model))
    {
      favorites.remove(model);
    }

print(model.fav);
 print(favorites.length);
 emit(FavoritesSuccessfully());

    return model.fav;
  }
  void removeFavProduct(model)
  {
    favorites.remove(model);
    emit(RemovedSuccessfully());
  }



}
class UserModel{
  String name;
  String subTitle;
  String image;
bool fav;

  UserModel({required this.fav,
    required this.name,required this.image,required this.subTitle});
}