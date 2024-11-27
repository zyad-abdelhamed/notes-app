class Favoritemodel {
  String? titel;
  String? body;
  Favoritemodel({required this.titel,required this.body});
  Favoritemodel.formjson(Map m){
   // titel=m[]
  }
}