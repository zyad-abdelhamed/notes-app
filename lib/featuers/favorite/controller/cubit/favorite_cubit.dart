import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()){
   // loadfavorites();
  }
//, required int id
//, 'id': id
  List<Map> favorites = [];
  Future<Future<List<Map>>> addtofavorites({required String titel, required String body}) async{
   favorites.add({'favoritetitel': titel, 'favoritebody': body});
 return loadfavorites();
  }

 void removefromfavorite({required String titel, required String body}){
     favorites.remove({'favoritetitel': titel, 'favoritebody': body});
     loadfavorites();
  }

 Future<List<Map>> loadfavorites() async{
    return favorites;
  }
}
