import 'package:cloud_firestore/cloud_firestore.dart';

class BreedModel {
  int? id;
  String? name;
  String? origin;
  String? reference_image_id;
  String? bred_for;


  BreedModel({
    this.id,
    this.name,
    this.origin,
    this.reference_image_id,
    this.bred_for
  });


  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
        id: map['id'],
        name: map['name'],
        origin: map['origin'],
        reference_image_id:map ['reference_image_id'],
        bred_for: map['bred_for']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name':name,
      'origin':origin,
      'reference_image_id':reference_image_id,
      'bred_for':bred_for
    };
  }



   factory BreedModel.fromQuerySnapshot(QueryDocumentSnapshot document){
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return BreedModel(
      id: data['id'],
      name: data['name'],
      origin: data['origin'],
      reference_image_id:data ['reference_image_id'],
      bred_for: data['bred_for']
      /*originalLanguage: data['original_language'],
      originalTitle: data['original_title'],
      overview: data['overview'],
      popularity: data['popularity'],
      posterPath: data['poster_path'],
      releaseDate: data['release_date'],
      title: data['title'],
      voteAverage: data['vote_average'],
      voteCount: data['vote_count'],*/
    );
  }
}
