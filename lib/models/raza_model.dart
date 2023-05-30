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
}
