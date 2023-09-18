class FaviroteModel {
  dynamic id;
  String? images;
  String? title;
  double? price;

  FaviroteModel({
    this.id,
    required this.images,
    required this.title,
    required this.price,
  });

  FaviroteModel.fromMap(Map<dynamic, dynamic> fromMap) {
    id = fromMap['id'];
    images = fromMap['images'];
    title = fromMap['title'];
    price = fromMap['price'];
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'images': images,
      'title': title,
      'price': price,
    };
  }
}
