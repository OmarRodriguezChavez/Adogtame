class PostModel {
  int? id;
  String? name;
  String? raza;
  String? talla;
  String? image;
  int? age;
  String? sexo;

  PostModel({this.id, this.name, this.raza, this.talla, this.image, this.age, this.sexo});
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        id: map['id'],
        name: map['name'],
        raza: map['raza'],
        talla: map['talla'],
        image: map['image'],
        age: map['age'],
        sexo: map['sexo']);
  }
}