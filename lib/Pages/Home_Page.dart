import 'package:flutter/material.dart';
import '../Models/Model_Character.dart';
import '../Widgets/Card_Character.dart';
import '../Provider/DragonBall_provider.dart';
import '../Widgets/Pageview_Character.dart';

class MyHomePage extends StatelessWidget{

  MyHomePage({Key? key, required this.title}):super(key: key);
  
  final String title;


  var characterProvider = DragonBallProvider();

  @override
  Widget build (BuildContext context){
    characterProvider.getCharacter();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dragon Ball'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _ShowCardCharacter(),
            Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _ShowCardCharacter(){  
    return FutureBuilder(
      future: characterProvider.getCharacter(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
         if (snapshot.hasData) {
          return CharacterPage(personaje: snapshot.data as List<ModelCharacter>);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      }
    );
    
  }

}
