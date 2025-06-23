class Category {
  int? id;
  String? name;
  String? nameKm;

  Category({this.id, this.name, this.nameKm});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nameKm': nameKm,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      nameKm: map['nameKm'],
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, nameKm: $nameKm)';
  }
}
