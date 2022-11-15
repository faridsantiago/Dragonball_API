import 'dart:html';

import 'package:flutter/material.dart';
import '../Models/Model_Character.dart';
import '../Widgets/Card_Character.dart';
import '../Provider/DragonBall_provider.dart';

class CharacterPage extends StatelessWidget {
  final List<ModelCharacter> personaje;

  const CharacterPage({Key? key, required this.personaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            height: _screenSize.height * 0.5,
            width: _screenSize.width * 0.5,
            child: PageView.builder(
              itemCount: personaje.length,
              itemBuilder: (BuildContext context, int index) {
                return cardCharacter(personaje[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
