class CategoryModel {
  CategoryModel({
    required this.name,
    required this.link,
  });
  late final String name;
  late final String link;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['link'] = link;
    return _data;
  }
}
