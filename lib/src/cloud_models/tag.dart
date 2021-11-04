
import 'translation.dart';

class Tag {
  DateTime? date;
  String description;
  List<Translation>? descriptionTranslations;
  String? idTag;
  String name;
  List<Translation>? nameTranslations;
  String? parentIdTag;

  Tag({
    this.date,
    required this.description,
    this.descriptionTranslations,
    this.idTag,
    required this.name,
    this.nameTranslations,
    this.parentIdTag
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      date: json['date'] as DateTime,
      description: json['description'] as String,
      descriptionTranslations: json['descriptionTranslations'] as List<Translation>,
      idTag: json['id_tag'] as String,
      name: json['name'] as String,
      nameTranslations: json['nameTranslations'] as List<Translation>,
      parentIdTag: json['parentId_tag'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['description'] = description;
    if (descriptionTranslations != null) {
      data['descriptionTranslations'] =
          descriptionTranslations!.map((v) => v.toJson()).toList();
    }
    data['id_tag'] = idTag;
    data['name'] = name;
    if (nameTranslations != null) {
      data['nameTranslations'] = nameTranslations!.map((v) => v.toJson()).toList();
    }
    data['parentId_tag'] = parentIdTag;
    return data;
  }

  DateTime? get getDate => date;
  set setDate(DateTime date) => this.date = date;

  String get getDescription => description;
  set setDescription(String description) => this.description = description;

  List<Translation>? get getDescriptionTranslations => descriptionTranslations;
  set setDescriptionTranslations(List<Translation> descriptionTranslations) => this.descriptionTranslations = descriptionTranslations;

  String? get getIdTag => idTag;
  set setIdTag(String idTag) => this.idTag = idTag;

  String get getName => name;
  set setName(String name) => this.name = name;

  List<Translation>? get getNameTranslations => nameTranslations;
  set setNameTranslations(List<Translation> idEvent) => this.nameTranslations = nameTranslations;

  String? get getParentIdTag => parentIdTag;
  set setParentIdTag(String parentIdTag) => this.parentIdTag = parentIdTag;
}
