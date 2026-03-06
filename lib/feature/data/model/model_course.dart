class ModelCourse {
  final String? title, image, desc, id, url;

  final dynamic price;

  ModelCourse({
    this.title,
    this.image,
    this.desc,
    this.price,
    this.id,
    required this.url,
  });

  factory ModelCourse.fromJson(Map<String, dynamic> data) {
    return ModelCourse(
      url: data['vedeo_url'],
      id: data['id'],
      title: data['title'],
      image: data['image'],
      desc: data['desc'],
      price: data['price'],
    );
  }
}
