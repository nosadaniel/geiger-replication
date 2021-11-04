class Translation {
	String idTranslation;
	String language;
	DateTime date;
	String? content;

	Translation({
    required this.idTranslation, 
    required this.language, 
    required this.date, 
    this.content
  });

	factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      idTranslation: json['id_translation'] as String,
      language: json['language'] as String,
      date: json['date'] as DateTime,
      content: json['content'] as String,
    );
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id_translation'] = idTranslation;
		data['language'] = language;
    data['date'] = date;
		data['content'] = content;
		return data;
	}

  DateTime get getDate => date;
  set setDate(DateTime date) => this.date = date;

  String get getLanguage => language;
  set setLanguage(String language) => this.language = language;

  String? get getContent => content;
  set setContent(String content) => this.content = content;

  String get getIdTranslation => idTranslation;
  set setIdTranslation(String idTranslation) => this.idTranslation = idTranslation;
}