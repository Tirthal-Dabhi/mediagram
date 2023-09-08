import 'package:bloc/bloc.dart';
import 'package:mediagram/service/Firebase/curd_user_database.dart';

class FavouriteCubit extends Cubit<bool> {
  bool isFavourite;
  FavouriteCubit(this.isFavourite) : super(isFavourite);
  addFavourite(String postID){
    emit(true);
    FirebaseDatabaseCollection.addUserFavourites(postID);
  }

  removeFavourite(String postID){
    emit(false);
    FirebaseDatabaseCollection.removeUserFavourites(postID);
  }
}
