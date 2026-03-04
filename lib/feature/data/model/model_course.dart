class ModelCourse {
  final String? title, image, desc;
  final dynamic price;

  ModelCourse({this.title, this.image, this.desc, this.price});

  factory ModelCourse.fromJson(Map<String, dynamic> data) {
    return ModelCourse(
      title: data['title'],
      image: data['image'],
      desc: data['desc'],
      price: data['price'],
    );
  }
}
