import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Model_Character.dart';

class DragonBallProvider{
  final _url = "https://dragon-ball-super-api.herokuapp.com";

  int _characterPage = 0;
  bool _loading = false;

  List<ModelCharacter> _character =[];

  final _characterStreamController = StreamController<List<ModelCharacter>>.broadcast();
  Function(List<ModelCharacter>) get characterSink => _characterStreamController.sink.add;
  Stream<List<ModelCharacter>> get characterStream => _characterStreamController.stream;

  void disposeStreams(){
    _characterStreamController.close();
  }
  

  Future <List<ModelCharacter>> getCharacter() async{
    if(_loading) return [];
    _loading = true;
    _characterPage++;
    
    final url = Uri.https(_url,'/api/characters',{
      'page': _characterPage.toString(),
    });
    print("llegó hasta despues de url ");
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    print("llegó hasta despues de decodeData ");

    final personaje = new Character.fromJsonList(decodeData['results']);
    print(personaje);
    print("llego hasta despues de personaje");
    return personaje.items;
    
   
  }
}
