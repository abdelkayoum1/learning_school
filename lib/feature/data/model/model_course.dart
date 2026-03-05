class ModelCourse {
  final String? title, image, desc, id;

  final dynamic price;

  ModelCourse({this.title, this.image, this.desc, this.price, this.id});

  factory ModelCourse.fromJson(Map<String, dynamic> data) {
    return ModelCourse(
      id: data['id'],
      title: data['title'],
      image: data['image'],
      desc: data['desc'],
      price: data['price'],
    );
  }
}
