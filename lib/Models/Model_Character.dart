import 'package:flutter/material.dart';
import '../Provider/DragonBall_provider.dart';
class Character {
  List<ModelCharacter> items = [];

  Character();

  Character.fromJsonList(jsonList) {
    for (var item in jsonList) {
      final listado = ModelCharacter.fromJsonMap(item);
      items.add(listado);
    }
  }
}

class ModelCharacter {
  ModelCharacter({
    required this.id,
    required this.image,
    required this.name,
    required this.originPlanet,
    required this.role,
    required this.species,
    required this.status,
    required this.transform,
    required this.universe,
    
  });
  
  String id;
  String image;
  String name;
  String originPlanet;
  String role;
  String species;
  String status;
  String transform;
  String universe;

  factory ModelCharacter.fromJsonMap(Map<String,dynamic> json)=> ModelCharacter(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    originPlanet: json["originPlanet"],
    role: json["role"],
    species: json["species"],
    status: json["status"],
    transform: json["transform"],
    universe: json["universe"],
  );




}