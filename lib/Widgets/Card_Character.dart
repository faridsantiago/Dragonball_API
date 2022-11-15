import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/Model_Character.dart';

Widget cardCharacter(ModelCharacter character){

  return Card(
    child: Column(
      children: [
        ListTile(
          leading: Image.network(character.image),
          title: Text(character.name),
          subtitle: Text(character.status),
        ),
      ],
    ),
  );

}