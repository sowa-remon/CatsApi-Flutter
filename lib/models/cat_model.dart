class Cats {
  List<Cat> items = [];

  Cats();

  Cats.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final cat = Cat.fromJsonMap(item);
      items.add(cat);
    }
  }
}

class Cat {
  String? id;
  String? url;
  double? width;
  double? height;

  Cat({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  Cat.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'] / 1;
    height = json['height'] / 1;
  }

  // Método para obtener la imagen del gato
  getCatImage() {
    if (url == null) {
      return 'https://freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png';
    } else {
      return url;
    }
  }

  getCatInfo() {}
}
