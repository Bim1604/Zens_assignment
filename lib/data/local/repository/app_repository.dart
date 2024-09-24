import 'package:sembast/sembast.dart';
import 'package:zens_assignment/data/local/db/database.dart';
import 'package:zens_assignment/screens/home/models/joke_model.dart';

class JokeRepository {
  final _store = intMapStoreFactory.store('joke_vote');

  Future<int> addJoke(JokeModel joke) async {
    final db = await AppDatabase.instance.database;
    return await _store.add(db, joke.toJson());
  }

  Future<List<JokeModel>> getJokes() async {
    List<JokeModel> result = List.empty(growable: true);
    try {
      final db = await AppDatabase.instance.database;
      var response = await _store.find(db);
      if (response.isNotEmpty) {
        response.map((e) => result.add(JokeModel.fromJson(e.value))).toList();
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<JokeModel?> findOneJoke(int id) async{
    JokeModel? result = JokeModel();
    try{
      final db = await AppDatabase.instance.database;
      var response = await _store.findFirst(db,finder: Finder(filter: Filter.equals("id",id)));
      if(response != null && response.value.isNotEmpty){
        var temp = response.value;
        result = JokeModel.fromJson(temp);
      }
    }
    catch(e){
      print(e);
    }
    return result;
  }
}